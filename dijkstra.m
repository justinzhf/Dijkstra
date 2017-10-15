function [cost,path]=dijkstra(graph,sou,des)
% 无向图的最短路径算法
%eg： A=[inf 1 5 10;1 inf 1 4;5 1 inf 1;10 4 1 inf]，不直接相连的点，或自身到自身，都记为Inf
%[c,p]dijkstra(A,1,4), c=3 p=[4,3,2,1]
[~,g_w]=size(graph);
path_g=zeros(1,g_w);
path_g(1,:)=graph(sou,:);
pre_min_index=sou;
min_index=sou;
path(1,1)=min_index;
graph(1,1)=inf;
count=2;
while min_index~=des
    [min_value,min_index]=min(path_g);
    graph(min_index,pre_min_index)=inf;
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
    pre_min_index=min_index;
end               
cost=min_value;
path(1,count)=des;
path=fliplr(path);
end