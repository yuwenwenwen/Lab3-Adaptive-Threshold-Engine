wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 {/home/E94091194/lab3/ate.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/testfixture"
wvSetPosition -win $_nWave1 {("G1" 21)}
wvSetPosition -win $_nWave1 {("G1" 21)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/bin} \
{/testfixture/binout\[0:23\]} \
{/testfixture/block_bin\[63:0\]} \
{/testfixture/clk} \
{/testfixture/cycle} -color ID_RED5 \
{/testfixture/expect_bin} \
{/testfixture/expect_threshold\[7:0\]} \
{/testfixture/goterror\[31:0\]} \
{/testfixture/helfCYCLE} -color ID_ORANGE5 \
{/testfixture/i\[31:0\]} \
{/testfixture/inputblock\[31:0\]} \
{/testfixture/inputpixel\[31:0\]} \
{/testfixture/outputblock\[31:0\]} \
{/testfixture/outputpixel\[31:0\]} \
{/testfixture/picin\[0:1535\]} \
{/testfixture/pix_data\[7:0\]} \
{/testfixture/reset} \
{/testfixture/startcompare\[31:0\]} \
{/testfixture/stcycle\[31:0\]} \
{/testfixture/threshold\[7:0\]} \
{/testfixture/thresholdout\[0:23\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 )} 
wvSetPosition -win $_nWave1 {("G1" 21)}
wvSetPosition -win $_nWave1 {("G1" 21)}
wvSetPosition -win $_nWave1 {("G1" 21)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/testfixture/bin} \
{/testfixture/binout\[0:23\]} \
{/testfixture/block_bin\[63:0\]} \
{/testfixture/clk} \
{/testfixture/cycle} -color ID_RED5 \
{/testfixture/expect_bin} \
{/testfixture/expect_threshold\[7:0\]} \
{/testfixture/goterror\[31:0\]} \
{/testfixture/helfCYCLE} -color ID_ORANGE5 \
{/testfixture/i\[31:0\]} \
{/testfixture/inputblock\[31:0\]} \
{/testfixture/inputpixel\[31:0\]} \
{/testfixture/outputblock\[31:0\]} \
{/testfixture/outputpixel\[31:0\]} \
{/testfixture/picin\[0:1535\]} \
{/testfixture/pix_data\[7:0\]} \
{/testfixture/reset} \
{/testfixture/startcompare\[31:0\]} \
{/testfixture/stcycle\[31:0\]} \
{/testfixture/threshold\[7:0\]} \
{/testfixture/thresholdout\[0:23\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 \
           18 19 20 21 )} 
wvSetPosition -win $_nWave1 {("G1" 21)}
wvGetSignalClose -win $_nWave1
wvZoomIn -win $_nWave1
wvSearchNext -win $_nWave1
wvSearchNext -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvZoomIn -win $_nWave1
wvSetCursor -win $_nWave1 8746.850218 -snap {("G1" 10)}
wvExit
