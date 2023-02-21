% h -> (G*M,N)
h = Channel_coff;
groupnum =  M*G;
C_cap_bs_nor = mapminmax(C_cap_bs, 0, 1);
C_cap_bs_nor_tmp = zeros(G*M,N);
for m=1:M
    C_cap_bs_nor_tmp(G*(m-1)+1:G*(m-1)+G,:) = C_cap_bs_nor(1,m);
end

%Gale-Shapley (GS) algorithm
[PFUEX,PFUE]=sort(h+C_cap_bs_nor_tmp,1,'descend');%�û���ƫ������
[PFCX,PFC]=sort(h+C_cap_bs_nor_tmp,2,'descend');%�ŵ���ƫ������
weifenn=1:N;
weifennn=N;
qingqiu=zeros(groupnum,N);%��������һ�����󣬵�i�е�j�е�������Ϊ�㣬�����i��ƫ������������Ϊj���û�����ȥ����i��
for jijiji=1:1000
    flagfff=0;%�жϸô�ѭ���Ƿ������û����ֺ�
    for iii=1:N%��iii��δ�����û���������
        if weifenn(iii)~=0%�����û�δ����
            flagfff=1;
            nnn=weifenn(iii);%��δ�����û��ı��
            for gggnnn=1:groupnum
                if PFUE(gggnnn,nnn)~=0%�������д�������0��˵�����ܾ���
                    weifenn(nnn)=0;%֤�����û��Ѿ������
                    ggg=PFUE(gggnnn,nnn);%�÷���ı��
                    PFUE(gggnnn,nnn)=0;%�������0��˵�����ܾ���
                    weifennn=weifennn-1;%δ�����û�����һ
                    break
                end
            end
            for nnnng=1:N%���û��ڸ÷���ƫ�������е�λ��
                if PFC(ggg,nnnng)==nnn%�ҵ���
                    qingqiu(ggg,nnnng)=nnn;%�͸ı���ֵ
                    break
                end
            end
        end
    end
    for jjj=1:groupnum%��ÿ���������̽��
        yonghus=0;%�жϸ����û��Ƿ�����
        for nnnh=1:N%̽��ÿ��λ��
            if qingqiu(jjj,nnnh)~=0%��λ�÷ǿղŻ��������
                yonghus=yonghus+1;%�����û��Ǹ���ڼ�˳λ
                if yonghus>(N/groupnum)%������û�����
                    weifennn=weifennn+1;%δ�����û�����һ
                    nnnnn=PFC(jjj,nnnh);%������ǰλ�õ��û��ı��
                    weifenn(nnnnn)=nnnnn;%����δ�����û��м��ϸ��û�
                    qingqiu(jjj,nnnh)=0;%�Ѹ��û��Ƴ������µġ��û�
                end
            end
        end
    end
    if flagfff==0
        break
    end
end
fenzzzz=zeros(groupnum,(N/groupnum));
for iiiiii=1:groupnum
    nnnnnn=0;
    for jjjjjj=1:N
        if qingqiu(iiiiii,jjjjjj)~=0
            nnnnnn=nnnnnn+1;
            fenzzzz(iiiiii,nnnnnn)=qingqiu(iiiiii,jjjjjj);
        end
    end
end
[PFUEX,PFUE]=sort(h,1,'descend');%�û���ƫ������
for ijijijij=1:1000000%����Ѱ��
    flagijijijij=0;
    for i=1:groupnum%���з���
        for j=1:(N/groupnum)%���������û�
            nnnnn=fenzzzz(i,j);%�ҵ����û��ı��
            flagggggg=0;
            for ggggg=1:(groupnum)%���Ƿ����Լ�Ը�⻻��ȥ��,�ӵ�ǰ�û�����ȥ�ķ��鿪ʼ
                gggggm=PFUE(ggggg,nnnnn);%��ǰ����
                if PFUE(ggggg,nnnnn)==i%����˵����Ŀǰ�ķ��飬��ô��ߵĶ����Բ�Ҫ
                    break
                end
                for nnnnnm=1:(N/groupnum)%�����һ��ifû�����������ҵ����뻻��ȥ�ķ��飬��ô�����Ƿ�÷������û����ȥ
                    nnnnnmm=fenzzzz(gggggm,nnnnnm);%Ŀǰ��̽�ĶԷ��û��ı��
%                     nnnnnmm
%                     h(i,nnnnnmm)
%                     h(gggggm,nnnnnmm)
                    if h(i,nnnnnmm)>h(gggggm,nnnnnmm)%�Է��н�������Ը,�ͽ���
                        yz=fenzzzz(gggggm,nnnnnm);
                        fenzzzz(gggggm,nnnnnm)=fenzzzz(i,nnnnnm);
                        fenzzzz(i,nnnnnm)=yz;
                        flagggggg=1;%һ�������������͵�������ǰ�û���ѭ��
                        flagijijijij=1;%һ�������ɹ����͵�ִ���´�Ѱ��
                        break
                    end
                end
                if flagggggg==1
                    break
                end
            end
        end
    end
    if flagijijijij==0%һ���޽����ɹ���������
        break
    end
end
fenzzzz=zhengxing1(fenzzzz,h);

% Output data convert
A = zeros(M*G,N);
for i=1:G*M
    for j=1:N/groupnum
        user_id = fenzzzz(i,j);
        A(i,user_id) = 1;
    end
end
        
       
            
            
            
            
            
            
            
            
            
            
