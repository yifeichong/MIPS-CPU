#############################################################
#�ж���ʾ���򣬼�����Ʋ��ԣ�����1�ż�������1ѭ����λ����
#�ж���ʾ���򣬼�����Ʋ��ԣ�����2�ż�������2ѭ����λ����
#���Ҳ���ʾ������ѭ������
#��ֻ���жϷ��������ʾ���򣬷����Ҽ���ж�Ƕ�ף�
#���ʱ��Ҫ���ǿ��жϣ����жϣ������ж���������������ָ��ʵ�֣���α����ֳ����ж���ָ����Ҫ��������
#############################################################

.text
addi $sp, $sp, -4     # push a0
sw $a0, 0($sp)
mfc0 $a0, $14         # get epc
addi $sp, $sp, -4     # push epc
sw $a0, 0($sp)
addi $sp, $sp, -4     # push s3
sw $s3, 0($sp)
addi $sp, $sp, -4     # push s4
sw $s4, 0($sp)
addi $sp, $sp, -4     # push s4
sw $s5, 0($sp)
addi $sp, $sp, -4     # push s4
sw $s6, 0($sp)

addi $s6,$zero,1       #�жϺ�1,2,3   ��ͬ�жϺ���ʾֵ��һ��

addi $s4,$zero,6      #ѭ��������ʼֵ  
addi $s5,$zero,1       #�������ۼ�ֵ
###################################################################
#                �߼����ƣ�ÿ����λ4λ 
# ��ʾ����������ʾ0x00000016 0x00000106 0x00001006 0x00010006 ... 10000006  00000006 ����ѭ��6��
###################################################################
IntLoop:
add $s0,$zero,$s6   

IntLeftShift:       


sll $s0, $s0, 4  
or $s3,$s0,$s4
add    $a0,$0,$s3       #display $s0
addi   $v0,$0,34         # display hex
syscall                 # we are out of here.   

bne $s0, $zero, IntLeftShift
sub $s4,$s4,$s5      #ѭ�������ݼ�
bne $s4, $zero, IntLoop

addi   $v0,$zero,10         # system call for exit
syscall                  # we are out of here. 

lw $s6, 0($sp)      # pop $s6
addi $sp, $sp, 4
lw $s5, 0($sp)      # pop $s6
addi $sp, $sp, 4
lw $s4, 0($sp)      # pop $s6
addi $sp, $sp, 4
lw $s3, 0($sp)      # pop $s6
addi $sp, $sp, 4
lw $a0, 0($sp)      # pop epc
addi $sp, $sp, 4
mtc0 $a0, $14
lw $a0 0($sp)       # pop $a0
addi $sp, $sp, 4