%��δ�����Ϊ�˷�ֹ���֣�
%�ɳں��ɳڽڵ�ĺ�̽ڵ��д���ǰ׺�ڵ��ͬ���û�
%Ϊ������£�ò����Ҫ����һ���������洢ǰ׺�ڵ��ˡ�������
%����������ÿ�ν����ɳڵĻ���Ҫ���еĲ���
qzjd(fz(n),:)=qzjd(gfz(g,v),:);
qzjd(fz(n),gfz(g,v))=1;
qzfz(fz(n),:)=qzfz(gfz(g,v),:);
qzfz(fz(n),w(gfz(g,v)))=1;
% for mme=1:(N+G)
%     if qzjd(mme,fz(n))==1%˵��mme�����׺�ڵ�
%         if qzfz(fz(n),w(mme))==1%˵���ǳ������ظ���Ҫ��mme���и���
%             if qzjd(fz(n),mme)~=1%����˵�����ͬ���ͬ�û�
%                 dis(mme)=maxedge;
%                 dfs(mme)=0;%����������ǰ׺�ڵ�
%             end
%         end
%     end
% end
qzsz(fz(n),2:end)=qzsz(gfz(g,v),1:(N+G-1));
qzsz(fz(n),1)=gfz(g,v);
if qzsz(fz(n),(G+1))~=0
    flagtcl=1;
    tcjd=fz(n);
end






            
        