main(q,{i=int.parse,a,b,x,y,s=0,p,m,n}){for(p in q){n=p.split('-');m=p.split(',');a=i(n[0]);b=i(m[0].split('-')[1]);x=i(m[1].split('-')[0]);y=i(n.last);s+=a<=x&&b>=x||x<=a &&y>=a?1:0;}print(s);}
