function GF=move(GF,qpx,g1,n1,g2,h,rr,rh)%ֱ���ϣ�ֱ�Ӷ���������ֱ�������һ��ͺ���
[G,N]=size(GF);
bnj1=0;%����1��bn��һ����
bnj2=0;%����2��bn��һ����
GF(g1,n1)=0;
for n=1:N%˳�����������鶼�����
    if GF(g1,qpx(g1,n))~=0
        GF(g1,qpx(g1,n))=bnj1*(rr(qpx(g1,n))+1)+rh(g1,qpx(g1,n));
        bnj1=GF(g1,qpx(g1,n));
    end
    if qpx(g2,n)==n1%��n1���в���
        GF(g2,qpx(g2,n))=bnj2*(rr(qpx(g2,n))+1)+rh(g2,qpx(g2,n));
        bnj2=GF(g2,qpx(g2,n));
        continue;
    end
    if GF(g2,qpx(g2,n))~=0
        GF(g2,qpx(g2,n))=bnj2*(rr(qpx(g2,n))+1)+rh(g2,qpx(g2,n));
        bnj2=GF(g2,qpx(g2,n));
    end
    
end



