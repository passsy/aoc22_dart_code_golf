main(List<String>a,{h,i,s=0}){for(i in a){var v=i.runes.map((c)=>c>96?c-96:c-38);h=v.length~/2;s+=v.take(h).where((c)=>v.skip(h).contains(c)as bool).first;};print(s);}
