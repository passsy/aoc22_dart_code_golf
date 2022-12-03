main(List<String>a,{i=0,s=0}){for(;i<a.length;i+=3)s+=a.skip(i).take(3).map((String l)=>l.runes.map((c)=>c>96?c-96:c-38)).reduce((a,b)=>a.where((c)=>b.contains(c))).first;print(s);}
