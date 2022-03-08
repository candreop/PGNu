#
# Costas Andreopoulos' Neutrino Physics Lectures
#
# Makefile
#

ACYEAR  = 202021
VERSION = v1

intro         : NAME = NUPHYS_${ACYEAR}-Slides-${VERSION}\ \(Intro\)
osc_pheno     : NAME = NUPHYS_${ACYEAR}-Slides-${VERSION}\ \(Lecture\ 01\)
osc_solar     : NAME = NUPHYS_${ACYEAR}-Slides-${VERSION}\ \(Lecture\ 02\)
osc_atmo      : NAME = NUPHYS_${ACYEAR}-Slides-${VERSION}\ \(Lecture\ 03\)
osc_future3nu : NAME = NUPHYS_${ACYEAR}-Slides-${VERSION}\ \(Lecture\ 04\)
osc_sterile   : NAME = NUPHYS_${ACYEAR}-Slides-${VERSION}\ \(Lecture\ 05\)
int_basics    : NAME = NUPHYS_${ACYEAR}-Slides-${VERSION}\ \(Lecture\ 06\)
int_qel       : NAME = NUPHYS_${ACYEAR}-Slides-${VERSION}\ \(Lecture\ 07\)
int_res       : NAME = NUPHYS_${ACYEAR}-Slides-${VERSION}\ \(Lecture\ 08\)
int_dis       : NAME = NUPHYS_${ACYEAR}-Slides-${VERSION}\ \(Lecture\ 09\)
int_coh       : NAME = NUPHYS_${ACYEAR}-Slides-${VERSION}\ \(Lecture\ 10\)
mass          : NAME = NUPHYS_${ACYEAR}-Slides-${VERSION}\ \(Lecture\ 11\)
astro         : NAME = NUPHYS_${ACYEAR}-Slides-${VERSION}\ \(Lecture\ 12\)
all           : NAME = NUPHYS_${ACYEAR}-Slides-${VERSION}
liv           : NAME = NUPHYS_${ACYEAR}-Liverpool-Slides-${VERSION}

intro         : tex_start tex_intro         tex_end pdf
osc_pheno     : tex_start tex_osc_pheno     tex_end pdf
osc_solar     : tex_start tex_osc_solar     tex_end pdf
osc_atmo      : tex_start tex_osc_atmo      tex_end pdf
osc_future3nu : tex_start tex_osc_future3nu tex_end pdf
osc_sterile   : tex_start tex_osc_sterile   tex_end pdf
int_basics    : tex_start tex_int_basics    tex_end pdf
int_qel       : tex_start tex_int_qel       tex_end pdf
int_res       : tex_start tex_int_res       tex_end pdf
int_dis       : tex_start tex_int_dis       tex_end pdf
int_coh       : tex_start tex_int_coh       tex_end pdf
mass          : tex_start tex_mass          tex_end pdf
astro         : tex_start tex_astro         tex_end pdf
all           : tex_start tex_intro tex_osc_pheno tex_osc_solar tex_osc_atmo tex_osc_future3nu tex_osc_sterile tex_int_basics tex_int_qel tex_int_res tex_int_dis tex_int_coh tex_mass tex_end pdf
liv           : tex_start tex_intro tex_osc_pheno tex_osc_solar tex_osc_atmo tex_osc_future3nu tex_osc_sterile tex_end pdf

tex_start:
	echo '\documentclass{beamer}'        >  main_tmp.tex
	echo '\input{slides_settings.tex}'   >> main_tmp.tex
	echo '\\begin{document}'             >> main_tmp.tex

tex_end:
	echo '\end{document}'                >> main_tmp.tex

tex_intro: FORCE
	echo     '\input{slides_intro.tex}'          >> main_tmp.tex
tex_osc_pheno: FORCE
	echo     '\input{slides_osc_pheno.tex}'      >> main_tmp.tex
tex_osc_solar: FORCE
	echo     '\input{slides_osc_solar.tex}'      >> main_tmp.tex
tex_osc_atmo: FORCE
	echo     '\input{slides_osc_atmo.tex}'       >> main_tmp.tex
tex_osc_future3nu: FORCE
	echo     '\input{slides_osc_future3nu.tex}'  >> main_tmp.tex
tex_osc_sterile: FORCE
	echo     '\input{slides_osc_sterile.tex}'    >> main_tmp.tex
tex_int_basics: FORCE
	echo     '\input{slides_int_basics.tex}'     >> main_tmp.tex
tex_int_qel: FORCE
	echo     '\input{slides_int_qel.tex}'        >> main_tmp.tex
tex_int_res: FORCE
	echo     '\input{slides_int_res.tex}'        >> main_tmp.tex
tex_int_dis: FORCE
	echo     '\input{slides_int_dis.tex}'        >> main_tmp.tex
tex_int_coh: FORCE
	echo     '\input{slides_int_coh.tex}'        >> main_tmp.tex
tex_mass: FORCE
	echo     '\input{slides_mass.tex}'           >> main_tmp.tex
tex_astro: FORCE
	echo     '\input{slides_astro.tex}'          >> main_tmp.tex

pdf: FORCE
	pdflatex main_tmp.tex
	mv main_tmp.pdf ${NAME}.pdf

clean: FORCE
	rm *nav
	rm *aux
	rm *log
	rm *out
	rm *snm
	rm *toc
	rm main_tmp.*

FORCE:
