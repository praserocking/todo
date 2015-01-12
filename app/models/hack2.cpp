#include<iostream>

using namespace std;

bool isSubsetSum(int set[], int n, int sum){
    bool subset[sum+1][n+1];
    for (int i = 0; i <= n; i++)
      subset[0][i] = true;
    for (int i = 1; i <= sum; i++)
      subset[i][0] = false;
     for (int i = 1; i <= sum; i++)
     {
       for (int j = 1; j <= n; j++)
       {
         subset[i][j] = subset[i][j-1];
         if (i >= set[j-1])
           subset[i][j] = subset[i][j] || subset[i - set[j-1]][j-1];
       }
     }
     return subset[sum][n];
}

int main(){
	int t,p,c,f,n,count=1;
	cin>>t;
	while(t--){
		cout<<"Case #"<<count<<": ";
		cin>>p>>c>>f;
		cin>>n;
		int pa[n],ca[n],fa[n];
		for(int i=0;i<n;i++){
			cin>>pa[i]>>ca[i]>>fa[i];
		}
		if(isSubsetSum(pa,n,p) && isSubsetSum(ca,n,c) && isSubsetSum(fa,n,f))
			cout<<"yes"<<endl;
		else
			cout<<"no"<<endl;
	}
}