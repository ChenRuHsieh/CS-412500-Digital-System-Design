#include "firmware.h"
#define K						5
#define MAX_INT                 2147483647
#define DATA_LENGTH             3073
#define NUM_CLASS				10
#define NUM_TEST_IMAGE			50
#define NUM_TRAIN_IMAGE			950
#define IMAGE_OFFSET 			0x00010000 

void knn_pcpi(void)
{
	int i, j, k;
	int distances[NUM_TRAIN_IMAGE];

	for(k = 0; k < NUM_TEST_IMAGE; k++){
	//	print_str("\nTEST_IG = ");
	//	print_dec(k);
	//	print_str("\n");
	//just an example of single test image!
	    for(i = 0; i < NUM_TRAIN_IMAGE; i++){
			//TODO: implement hardware & software versions of pairwise distance computation
			//e.g. distances[i] = hard_knn_pcpi(0, i + NUM_TEST_IMAGE);
			/*
			for(j = 1; j < DATA_LENGTH ; j++){
				int test_pixel = *(volatile uint32_t*)(IMAGE_OFFSET + (j) * 4);
				int trian_pixel = *(volatile uint32_t*)(IMAGE_OFFSET + ( (i + NUM_TEST_IMAGE) * DATA_LENGTH + j) * 4);
				distances[i] += (test_pixel - trian_pixel) * (test_pixel - trian_pixel);
			}
			print_str("\nTRAIN_IG = ");
			print_dec(NUM_TEST_IMAGE + i);
			print_str("\n");
			*/
			distances[i] = hard_knn_pcpi(k, i + NUM_TEST_IMAGE);
		}
		//TODO: implement hardware version of label voting
		//you can use the algorithm we provided below, or any better algorithm you can think of
		int closet_label[K];
		for(i = 0; i < K ; i++){
			closet_label[i] = hard_knn_pcpi(k, i+1000);
		}
	/*
		int top_images[K][2];
		for(i = 0; i < K; i++){
			top_images[i][0] = MAX_INT; //distances of top-K closest images
			top_images[i][1] = 0;		//labels of top-K closest images
		}
			
		//iterate through all images, only keep the top-K closest images
		for(i = 0; i < NUM_TRAIN_IMAGE; i++){
	        int insert_idx = -1;
			//get the index to insert, so that distances after this index are all larger
			for(j = 0; j < K; j++){
				if(distances[i] < top_images[j][0]){
					insert_idx = j;
					break;
				}
			}
			if(insert_idx >= 0){
				//insert new data, shift the rest
				for(j = K - 1; j > insert_idx; j--){
					top_images[j][0] = top_images[j-1][0];
					top_images[j][1] = top_images[j-1][1];
				}
				top_images[insert_idx][0] = distances[i];
				top_images[insert_idx][1] = i;
			}
		}
	*/
		int max_count = 0;
		int max_label = 0;
		int num_labels[NUM_CLASS] = {0};
		
		for(i = 0; i < K; i++){
			int label = closet_label[i];
			num_labels[label]++;
		}
		
		for(i = 0; i < NUM_CLASS; i++){
			if(num_labels[i] > max_count){
				max_count = num_labels[i];
				max_label = i;
			} 
		}
		//find the label which gets the most votes
		/*
		for(i = 0; i < K; i++){
			int label = *(volatile uint32_t*)(IMAGE_OFFSET + (top_images[i][1] + NUM_TEST_IMAGE) * DATA_LENGTH * 4);
			print_str(" ");
			print_dec(label);
		}
		print_str("\n");
		*/
		/*
		for(i = 0; i < NUM_CLASS; i++){
			if(num_labels[i] > max_count){
				max_count = num_labels[i];
				max_label = i;
			} 
		}*/
		
		
		print_str("The result of soft_knn is:");
		print_dec(max_label);
		print_str("\n");
	}
}

