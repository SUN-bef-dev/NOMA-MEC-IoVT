%����һ��̰���㷨
%��һ��Ѱ��J����С��������
%
function [fuhuan,flagJ]=Greedy(J,GF,INF,alpha)
[G,N]=size(GF);
flagJ=0;

w=zeros(1,(N+G));%��¼ÿ���û��ķ�����Ϣ
fuhuan=zeros(1,(N+G));%��ֹ�㷨�����
fz=zeros(1,(G+N));%���ڷ��÷�����Ϣ���������û����������������
fzx=1;%̽�鵽�ڼ���λ��
huancsh=zeros(1,(G-1));%������ʼ�������ڼ�¼�ҵ�������С��˳��
huanjl=zeros(1,(G-1));%�������룩���ڼ�¼�ҵ�������С����Ȩֵ
fzg=fz;%����fz���û���Ӧ�ķ�����
gfz=zeros(G,(N+G));%��������ʹ��gfzǰ������ֵ���������������û������Ǿ������û���Ż����û���fz���Ҫ��ϸ����
for j=1:G
    gfzx=1;%̽�鵽��gfz��j�еĵڼ���λ��
    for i=1:(N)
        if GF(j,i)~=0
            fz(fzx)=i;
            fzg(fzx)=j;
            fzx=fzx+1;
            gfz(j,gfzx)=i;
            gfzx=gfzx+1;
            w(i)=j;%��¼ÿ���û��ķ�����Ϣ
        end
        if i==N
            fz(fzx)=i+j;
            fzg(fzx)=j;
            fzx=fzx+1;
            gfz(j,gfzx)=i+j;%�������õĻ���gfz��fz��һһ��Ӧ��
            gfzx=gfzx+1;
            w(N+j)=j;%��¼ÿ���û��ķ�����Ϣ
        end
    end
end
Jbeifen=J;%������J���ֵ���в��������Ի��Ǳ���һ�±ȽϺ�
Jbeiyong=J;
LLLmin=INF;
huanmin=fuhuan;

for iii=1:ceil((G+N)*alpha)
    
    [L,X]=min(min(Jbeiyong'));
    [L,Y]=min(min(Jbeiyong));
    if L>=0
        break;
    end
    Jbeiyong(X,Y)=INF;
    
    
    
    
    
    J=Jbeifen;
    for n=1:(G+N)%���ڷ�ֹ�������õ�����
        if w(n)==w(X)
            J(n,:)=INF;
            J(:,n)=INF;
        end
    end
    
    huancsh(1)=Y;
    huanjl(1)=L+Jbeifen(Y,X);
    for n=1:(G+N)%���ڷ�ֹ�������õ�����
        if w(n)==w(Y)
            J(n,:)=INF;
            J(:,n)=INF;
        end
    end
    
    for qqq=2:(G-1)
        [xyL,Y]=min(J(Y,:));
        huancsh(qqq)=Y;
        for n=1:(G+N)%���ڷ�ֹ�������õ�����
            if w(n)==w(Y)
                J(n,:)=INF;
                J(:,n)=INF;
            end
        end
        
        huanjl(qqq)=huanjl(qqq-1)-Jbeifen(huancsh(qqq-1),X)+xyL+Jbeifen(Y,X);
    end
    [LLL,YYY]=min(huanjl);
    if LLL<0
        fuhuan(1)=X;
        fuhuan(2:(YYY+1))=huancsh(1:YYY);
        fuhuan(YYY+2)=X;
    end
    
    if LLL<LLLmin
        LLLmin=LLL;
        huanmin=fuhuan;
    end
end
if LLLmin<0
    fuhuan=huanmin;
    flagJ=1;
end