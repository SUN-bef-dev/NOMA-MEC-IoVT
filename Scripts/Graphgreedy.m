%ʹ������ͼ���̰��
shiboyi3gaijin;%�õ�GF����
for iqiqiqiq=1:10000000000000%������ǲ������е�breakΪֹ������Ҫע������ĵ���������������ѭ��������forѭ���еĵ��������ظ�
    GFbeifen1=GF;
    GraphJ;%�õ��ڽӾ���J
    
    [fuhuan,flagJ]=greedyhuan(J,GF,INF);%���и�������flagJ=1���õ�����fuhuan�����޸�������flagJ=0���˳���
    if flagJ==1
        fuhuangengxin1;%���и�������flagJ=1�������õ��ĸ���fuhuan��ָ��Ĳ������и���
        
    if sum(max(GF'))>sum(max(GFbeifen1'))
        woyoucuole=woyoucuole+1
            break;
        end
    else
        break;
    end
end
iqiqiqiq
