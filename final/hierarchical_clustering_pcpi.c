#include "firmware.h"
#define K						5
#define MAX_INT                 2147483647
#define DATA_LENGTH             3073
#define NUM_CLASS				10
#define NUM_TEST_IMAGE			51
#define NUM_TRAIN_IMAGE			950
#define IMAGE_OFFSET 			0x00010000 
#define Final_Cluster_num 4


#define ADD 201
#define COMPARE 202
#define CHOSE 203
#define GET_NEW_DIS 204
#define PRINT 205
#define RANGE 206
#define RST_RANGE 207
#define GET_VALUE_R 208
#define GET_VALUE_G 209
#define GET_VALUE_B 210

void hierarchical_clustering_pcpi(void)
{
	int i, j, k, w;
	int node_dis[NUM_TEST_IMAGE][NUM_TEST_IMAGE];
	int cluster_dis[NUM_TEST_IMAGE][NUM_TEST_IMAGE];
	int cluster[NUM_TEST_IMAGE];
	int root_1, root_2, child_1, child_2, cluster_num = NUM_TEST_IMAGE;
	
	for(i = 0; i < NUM_TEST_IMAGE; i++){
		cluster[i] = i;
	}
	
	for(i = 1; i < NUM_TEST_IMAGE; i++){
	    for(j = i + 1; j < NUM_TEST_IMAGE; j++){
			node_dis[i][j] = hard_hierarchical_clustering_pcpi(i, j);
			/*
			int R_dis = hard_knn_pcpi(i, GET_VALUE_R) - hard_knn_pcpi(j, GET_VALUE_R);
			int G_dis = hard_knn_pcpi(i, GET_VALUE_G) - hard_knn_pcpi(j, GET_VALUE_G);
			int B_dis = hard_knn_pcpi(i, GET_VALUE_B) - hard_knn_pcpi(j, GET_VALUE_B);
			node_dis[i][j] = R_dis*R_dis + G_dis*G_dis + B_dis*B_dis;
			*/
			node_dis[j][i] = node_dis[i][j];
			cluster_dis[i][j] = node_dis[i][j];
			cluster_dis[j][i] = cluster_dis[i][j];
		}
	}
	
	while(cluster_num != Final_Cluster_num){
		int smallest_dis = MAX_INT;
		int smallest_node[2] = {0};
		for(root_1 = 1; root_1 < NUM_TEST_IMAGE; root_1++){
			if(cluster[root_1] == root_1){
			
				for(root_2 = root_1 + 1; root_2 < NUM_TEST_IMAGE; root_2++){
					if(cluster[root_2] == root_2){
				
						if(cluster_dis[root_1][root_2] < smallest_dis){
							smallest_dis = cluster_dis[root_1][root_2];
							smallest_node[0] = root_1;
							smallest_node[1] = root_2;
						}
					}
				}
			}
		}
		
		//print_str("smallest_dis =  ");
		//print_dec(smallest_dis);
		//print_str("\n");
		//Connect
		root_1 = cluster[smallest_node[0]];
		root_2 = cluster[smallest_node[1]];
		
		for(i = 1; i < NUM_TEST_IMAGE; i++){
			if(cluster[i] == root_2){
				cluster[i] = root_1;
			}
			
		}
		cluster_dis[root_1][root_2] = MAX_INT;
		cluster_dis[root_2][root_1] = MAX_INT;
		cluster_num--;
		
		int cluster_1_num = 0;
		int cluster_2_num = 0;
		int count = 0, distance = 0;
	
		for(root_2 = 1; root_2 < NUM_TEST_IMAGE; root_2++){
			//print_str("Find ROOT2\n");
			distance = 0;
			if( (cluster[root_2] == root_2) && (cluster[root_2] != root_1) ){
				for(child_1 = 1; child_1 < NUM_TEST_IMAGE; child_1++){
					if(cluster[child_1] == root_1){
						cluster_1_num++;
						
						for(child_2 = 1; child_2 < NUM_TEST_IMAGE; child_2++){
							if(cluster[child_2] == root_2){
								if(count == 0)
									cluster_2_num++;
								
								//hard_knn_pcpi(node_dis[child_1][child_2], ADD);
								distance = distance + node_dis[child_1][child_2];
							}
						}
					count = 1;
					}
				}
				//cluster_dis[root_1][root_2] = hard_knn_pcpi(0, GET_NEW_DIS) / (cluster_1_num + cluster_2_num);
				cluster_dis[root_2][root_1] = distance / (cluster_1_num + cluster_2_num);
				cluster_dis[root_2][root_1] = cluster_dis[root_1][root_2];
				count = 0;
			}
		}
	}

	for(root_1 = 1; root_1 < NUM_TEST_IMAGE; root_1++){
		print_str("ROOT");
		print_dec(root_1);
		print_str("=");
		print_dec(cluster[root_1]);
		print_str("\n");
	}
	
	for(root_1 = 1; root_1 < NUM_TEST_IMAGE; root_1++){
		hard_knn_pcpi(0, RST_RANGE);
		if(cluster[root_1] == root_1){
			print_str("\n ROOT= ");
			print_dec(root_1);
			print_str("\n");
			for(child_1 = 1; child_1 < NUM_TEST_IMAGE; child_1++){
				
				if(cluster[child_1] == root_1){
					hard_hierarchical_clustering_pcpi(child_1, PRINT);
				}
			}
			hard_hierarchical_clustering_pcpi(0, RANGE);
		}
	}
}

