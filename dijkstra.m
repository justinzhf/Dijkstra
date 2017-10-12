function [cost,path]=dijkstra(graph,sou,des)
[~,g_w]=size(graph);
path_g=1./zeros(1,g_w);
path_g(1,:)=graph(sou,:);
cost=0;
min_index=sou;
path(1,1)=min_index;
count=2;
while min_index~=des
    [min_value,min_index]=min(path_g);
    cost=cost+min_value;
    graph(min_index,sou)=inf;
    new_path_g=graph(min_index,:)+min_value;
    path_g(1,min_index)=inf;
    tmp_g=sort([path_g;new_path_g]);
    path_g=tmp_g(1,:);
    path(count,1)=min_index;
end
end