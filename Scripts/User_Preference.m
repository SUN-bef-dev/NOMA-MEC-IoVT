% h -> (G*M,N)
h = Channel_coff;
groupnum =  M*G;
% User preference algorithm
[PFUEX,PFUE]=sort(h,1,'descend');%�û���ƫ������
[PFCC,PFC]=sort(Omega,'descend');%�ŵ���ƫ������,���ƫ����Ҫ��ǰ����������ȥ����Ȼ����
fenzu=zeros(groupnum,N/groupnum);
for jj=1:N
    j=PFC(jj);
    flagooo=0;
    for i=1:groupnum
        for z=1:(N/groupnum)
            if fenzu(PFUE(i,j),z)==0%�û�j�ĵ�iƫ�÷���
                fenzu(PFUE(i,j),z)=j;
                flagooo=1;
                break;
            end
            if flagooo==1
                break
            end
        end
        if flagooo==1
            break
        end
    end
end
for ijijijij=1:1000000%����Ѱ��
    flagijijijij=0;
    for i=1:groupnum%���з���
        for j=1:(N/groupnum)%���������û�
            nnnnn=fenzu(i,j);%�ҵ����û��ı��
            flagggggg=0;
            for ggggg=1:(groupnum)%���Ƿ����Լ�Ը�⻻��ȥ��,�ӵ�ǰ�û�����ȥ�ķ��鿪ʼ
                gggggm=PFUE(ggggg,nnnnn);%��ǰ����
                if PFUE(ggggg,nnnnn)==i%����˵����Ŀǰ�ķ��飬��ô��ߵĶ����Բ�Ҫ
                    break
                end
                for nnnnnm=1:(N/groupnum)%�����һ��ifû�����������ҵ����뻻��ȥ�ķ��飬��ô�����Ƿ�÷������û����ȥ
                    nnnnnmm=fenzu(gggggm,nnnnnm);%Ŀǰ��̽�ĶԷ��û��ı��
%                     nnnnnmm
%                     h(i,nnnnnmm)
%                     h(gggggm,nnnnnmm)
                    if h(i,nnnnnmm)>h(gggggm,nnnnnmm)%�Է��н�������Ը,�ͽ���
                        yz=fenzu(gggggm,nnnnnm);
                        fenzu(gggggm,nnnnnm)=fenzu(i,nnnnnm);
                        fenzu(i,nnnnnm)=yz;
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
fenzu=zhengxing1(fenzu,h);

% Output data convert
A = zeros(M*G,N);
for i=1:G*M
    for j=1:N/groupnum
        user_id = fenzu(i,j);
        A(i,user_id) = 1;
    end
end
        
        
        
        
        
        
        
        
        
        
        
        
        
        
