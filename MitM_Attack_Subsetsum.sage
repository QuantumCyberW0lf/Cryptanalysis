#!/usr/bin/env sage3
# -*- coding: utf-8 -*-
from sage.all_cmdline import *
import sys

try:
    import itertools
    import collections
except ImportError:
    print("[-] Module itertools/collections not found")
    sys.exit(-1)

n = 100
A = [1095096998633989418949378932070, 899442129266769897908681929257, 782740618551577186356239958024, 1189495392744135429352288614798, 822098884105764679908239033856, 1019772415776188237302866837073, 850280445277071909861902559614, 1102874800441030270726672380744, 859307047955191336271587803028, 773478156863849686876147530522, 1218151047457888114990013407311, 1234745298429637863608993884762, 1101463314357700583314506467477, 819459426492070594154679087989, 841306459095833498420539360481, 1134001261218757628377004863588, 1250963881529726052423600887247, 643333802669650373796372809953, 850460233008753668551699901588, 1221314563052269232812643344619, 910767734102789626965524431166, 940417465873888414569649046368, 650528809520408434809080384880, 768605143691110674203565253103, 948688664911163817908644188506, 1026477185644822621333358205010, 812484063028182224802860307812, 634411895367028239856288772032, 1074168344306543964946676219013, 677668543987823710957343200511, 846769439630494617725034237852, 1209651244478371105922948566329, 653815698268319794149802422029, 931063467834236076772079951410, 1057578362506846535931765355938, 1069688523028856618559960225944, 1227341802502669931985400116227, 833784955115729890110317533397, 1221438798700386329685596306676, 822166700169678043507506200946, 878404961897563669192461883598, 1199957493771382646667417791137, 768415978314328267126421228920, 1118687980542672612395190397692, 649812974816690051671160738746, 1154377099156507397048871373118, 1103475927326379052287016377887, 1080855935695105202731215736892, 1232752046404129404552773874000, 1000650949919753031250966590693, 1048851531342388977970268809076, 706924124998157672315306032675, 841361442903315803942869107581, 1200713879532352984848678610582, 1230669556274498553107651914789, 1073970716488360518862391127507, 1191529884920247217890351078194, 1120168163513926981875663589866, 1055626689938742640897614340557, 1084854149671881802720415146591, 755978056278428645490342540808, 1073657811509307775419685710450, 1126367711095718007226646310840, 1123222324147910669456671056180, 1235767540688277129430618796707, 1205995601437048548144917746949, 719100967427379649470427440370, 1122027642476814531711527605577, 1035064369466877362266992837537, 1003720796881540568206850250440, 1039175277570790822252372808342, 1048644049634057350438657990341, 1093102098361286248228637528275, 669929573012097295779499821974, 1197742119181534876481685121714, 842661610469898294863381577081, 777543819180469298974975556561, 837674782239388977739618093226, 1009011126676385399458088606569, 1067714808693605662358360911987, 1075545314769236648630277629422, 1255707543087387906525314405198, 725665470502069178475139228868, 731622099757986051502373552259, 1254311428645358010099659692691, 661028738000177642727467406968, 714997568231718872706627132028, 989732291221413217557976456220, 914355184261634117759421289047, 819033861954350047184972997509, 945543563725007991274857864286, 993382715467216069988299437105, 925068106805628246528534354489, 732671944717729868585423418401, 863119165057678677508470165399, 909013934797993835646055841523, 716825109873817283149278912752, 690494966901353500453794488041, 1092235256026824337752948435308, 708869552577480551205883705867]
s = 10464571397300712461978901312291

#def create_subsets(set_of_nums,card):
    #return set(itertools.combinations(set_of_nums,card))

def subsetsum(list_of_nums,target):
    I = set()
    subsets_1 = Subsets(range(n//2),n//20)
    #subsets_1 = create_subsets(set_1,n//20)
    dict_1 = {}
    for I_1 in subsets_1:
        sublist_1 = []
        for i in I_1:
            sublist_1.append(list_of_nums[i])
        dict_1[I_1] = sum(sublist_1)
    sorted_dict_1_as_list = sorted(dict_1.items(),key=lambda x: x[1])
    sorted_dict_1 = collections.OrderedDict(sorted_dict_1_as_list)
    #set_2 = set(range(n//2,n))
    subsets_2 = Subsets(range(n//2,n),n//20)
    for I_2 in subsets_2:
        sublist_2 = []
        for i in I_2:
            sublist_2.append(list_of_nums[i])
        for key in sorted_dict_1:
            if sorted_dict_1[key] == target - sum(sublist_2):
                I = I_2.union(key)
                return I,key,I_2
            else:
                print("In {} sum is not found in {}".format(sorted_dict_1[key],I_2.union(key)))

def main():
    I,I_1,I_2 = subsetsum(A,s)
    print("I = {}".format(I))
    print("I_1 = {}".format(I_1))
    print("I_2 = {}".format(I_2))

if __name__ == "__main__":
    main()
            
        
        