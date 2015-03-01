# function random_network
#  Generate a random network X and a compatible augmented network Y 
#
# 


# Input:
# total_path:    number of node in the original network X (g1) (default=25)
# total_k:       number of additional node in augmented network Y (g2) (default=5)
# vertex_ratio:  ratio of edge in proportion to total node in g2 (default: between 1 to 5 time the number of node)

# Output: 

# g1:          		network X
# g2:          		augmented network Y
# original_node:     total number of node in augmented network Y
# additional_node:   total number of edge in augmented network Y
# ngroup:            number of additional node
# vertex_ratio:      vertex to nodes ratio


# version 1.0
# created Etienne Lord
# since December 2014


random_network<-function(original_node=25, additional_node=5, ngroup=1, vertex_ratio=0.0, type='erdos') {
	#require(igraph);	
	total_node_in_g2=original_node+additional_node;
	if (vertex_ratio==0) vertex_ratio<-sample(1:5, 1);
	if (type=='erdos') {
		g2 <- erdos.renyi.game(total_node_in_g2,vertex_ratio*total_node_in_g2, type="gnm");
	} else {
		g2<-barabasi.game(total_node_in_g2, m=vertex_ratio, power=1.2, zero.appeal=1.3, directed=FALSE);
	}	
	
	V(g2)$name=paste("x",c(1:total_node_in_g2),sep="");
	E(g2)$weight=1.0;	
	to_remove=sample(1:total_node_in_g2,(total_node_in_g2-original_node), replace = FALSE);
	V(g2)$tax='1';
	i=1;
	for (vn in to_remove) {		
		if (i<=ngroup) {
			V(g2)[vn]$tax=paste('',i+1,sep=""); #ensure that we have at least a vertex of each groups
		} else {
			V(g2)[vn]$tax=paste('',1+sample(1:ngroup,1),sep="");
		}
		i=i+1;
	}
	g1 <- delete.vertices(g2,to_remove);
	V(g1)$tax=paste('',1,sep="");
	info_network(g1,g2);
	return (list("g1"=g1,"g2"=g2, "total_nodes"=length(V(g2)), "total_edges"=length(E(g2)), "total_original_nodes"=length(V(g1))));
}

#Example:
#
# r=random_network();
# complete_network(r$g1, r$g2);
# 
# 