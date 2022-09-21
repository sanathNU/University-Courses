#include <iostream>
#include <string>
#include <bits/stdc++.h>

#define v 10
#define INF 9999
using namespace std;

//function to return the minimum index
int minVertex( vector<int> & value, vector<bool> & processed){
    int min = INF;
    int vertex;

    for(int i=0;i<v;++i){
        if(processed[i]==false & value[i]<min ){
            vertex = i;
            min = value[i];
        }
    }
    return vertex;
}

//main function
void dijkstra(int graph[v][v], int n, int src){
    //running only for n nodes
    int parent[n];
    vector <int> values(n,INF);
    vector <bool> visited( n, false);

    parent[src] =-1;
    values[src] = 0;

    for(int i=0; i<n-1; i++){
        //selecting the minimum node
        int U = minVertex(values, visited);

        visited[U] = true;
        //relaxing adjoing vertices

        for(int j=0;j<n; ++j){
            /* 3 conditions
            1. The node shouldn't be visited
            2. The vertice should be connected to the parent vertex
            3. The distance + value < current_value
            */

           if(!visited[j] && graph[U][j]!=0 && values[U]!=INF && (values[U]+graph[U][j]<values[j])){
            values[j] = values[U]+ graph[U][j];
            parent[j] = U;
           }
        }
    }

    //printing the graph
    for(int i=1; i<n; ++i){
        cout<<"U->V: "<<parent[i]<<" -> " <<i <<" wt=" <<graph[parent[i]][i]<<"\n";
    }
}

int main()
{
    int G[v][v],n, s;
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