function rtn = listPush(list, item)
list{listSize(list) + 1} = item;
rtn = list;