function [cost,path]=dijkstra(graph,sou,des)
% 无向图的最短路径算法
%eg： A=[inf 1 5 10;1 inf 1 4;5 1 inf 1;10 4 1 inf]，不直接相连的点，或自身到自身，都记为Inf
%[c,p]=dijkstra(A,1,4), c=3 p=[4,3,2,1]
[~,g_w]=size(graph);
path_g=zeros(1,g_w);
path_g(1,:)=graph(sou,:);
min_index=sou;
min_value=0;
path(1,1)=min_index;
count=2;

all_min_index(1,1)=min_index;
ami_count=2;
graph(1,1)=inf;

while min_index~=des
    [min_value,min_index]=min(path_g);
    [~,p_w]=size(all_min_index);
    for i=1:p_w
       graph(min_index,all_min_index(1,i))=inf;
       graph(all_min_index(1,i),min_index)=inf;
    end
    all_min_index(1,ami_count)=min_index;
    ami_count=ami_count+1;
    
    path_g(1,min_index)=inf;
    new_path_g=graph(min_index,:)+min_value;
    
    tmp_g=sort([path_g;new_path_g]);
    if tmp_g(1,des)~=Inf
        if tmp_g(1,des)==new_path_g(1,des)
            path(1,count)=min_index;
            count=count+1;
        end
    end
    path_g=tmp_g(1,:);
end               
cost=min_value;
path(1,count)=des;
path=fliplr(path);
end