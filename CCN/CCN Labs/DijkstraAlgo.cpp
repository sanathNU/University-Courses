#include<iostream>
#define V 10
#define INF 9999
using namespace std;
void dijkstra(int g[V][V], int n, int src)
{
    int dist[V], cost[V][V],pred[V], visited[V];
    int count, minDist,nextNode;
    int j;
    for (int i = 0; i < n; i++){
        for (int j = 0; j< n; j++){
            if(g[i][j]==0)
                cost[i][j]=INF;
            else
                cost[i][j]=g[i][j];
        }
    }
    for(int i=0;i<n;i++)
    {
        dist[i]=cost[src][i];
        pred[i]=src;
        visited[i]=0;
    }
    dist[src]=0;
    visited[src]=0;
    count=1;

    while(count<n-1)
    {
    minDist=INF;
    for(int i=0;i<n;i++)
        if(dist[i]<minDist&&!visited[i]){
            minDist=dist[i];
            nextNode=i;
    }
    visited[nextNode]=1;
    for(int i=0;i<n;i++)
        if(!visited[i])
            if(minDist+cost[nextNode][i]<dist[i])
            {
                dist[i]=minDist+cost[nextNode][i];
                pred[i]=nextNode;
            }
    count++;
    }
//display
    for(int i =0 ;i < n ;i++){
        if(!src)
        {
        cout<<"Distance of node "<<i<<"="<<dist[i]<<endl;
        cout<<"Path:: "<<i;
        j=i;

        do{
            j=pred[j];
            cout<<"<--"<<j<<" ";
        }while(j!=src);
        cout<<endl;
        }
    }
}

int main()
{
    int G[V][V],n, s;
    cout<<"Enter the no. of vertices: ";
    cin>>n;
    cout<<endl;
    cout<<"Enter the matrix: \n";
    for(int i=0;i<n;i++)
        for(int j=0;j<n;j++)
            cin>>G[i][j];
    cout<<"Enter the starting node:";
    cin>>s;
    dijkstra(G,n,s);
    return 0;
}