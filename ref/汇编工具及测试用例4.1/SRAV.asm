#SLLV��λ����    revise date:2018/3/12 tiger

.text

addi $t0,$zero,1     #sllv ��λ����
addi $t1,$zero,3     #sllv ��λ����
addi $s1,$zero,0x876     #
sll $s1,$s1,20     #

add $a0,$0,$s1           
addi $v0,$zero,34         # system call for print
syscall                  # print

addi $t3,$zero,8

srav_branch:
srav $s1,$s1,$t0     #����1λ
srav $s1,$s1,$t1     #����3λ
add $a0,$0,$s1          
addi $v0,$zero,34         # system call for print
syscall                  # print
addi $t3,$t3, -1    
bne $t3,$zero,srav_branch   #ѭ��8��

addi   $v0,$zero,10         # system call for exit
syscall                  # we are out of here.   
