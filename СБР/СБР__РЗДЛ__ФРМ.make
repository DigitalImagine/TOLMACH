# D I G I T A L   I M A G I N E .   Т О Л М А Ч .   С Б О Р .   Ф О Р М И Р О В А Н И Е   С Б О Р Н О - И С Х О Д Н Ы Х   Р А З Д Е Л О В

# Пример Использования в bash:
#make -f /PRT/R/digitalimagine/S/ТЛМЧ/1783120800000/СБР/СБР__РЗДЛ__ФРМ.make \
	AV_V__CL__K=x86_64 \
	KNG__VTCHN=digitalimagine \
	KNG__VM=1783120800000 \
	KNG__SKRP=ЗАРЯ \
	RZDL__S__FRM=" \
        /PRT/R/digitalimagine:1783120800000:DI_SVTCH,ТЛМЧ,КВ,ОБЩ \
        /PRT/R/external_libs:1783120800000:MATH_CORE,CRYPTO_SHM \
        /PRT/R/hardware_drivers:1783120900000:UART_16550,SPI_FLASH \
	" \
;

# Пример Использования в bash 2:
#make -f /PRT/R/digitalimagine/S/ТЛМЧ/1783120800000/СБР/СБР__РЗДЛ__ФРМ.make \
	AV_V__CL__K=x86_64 \
	KNG__VTCHN=digitalimagine \
	KNG__VM=1783120800000 \
	KNG__SKRP=ЗАРЯ \
	RZDL__S__FRM=" \
		/PRT/R/digitalimagine:1783120800000:DI_SVTCH,ТЛМЧ,КВ,ОБЩ \
		/PRT/R/digitalimagine:1783120900000:ТЛМЧ,КВ \
		/PRT/R/external_libs:1783120800000:MATH_CORE,CRYPTO_SHM \
		/PRT/R/hardware_drivers:1783120900000:UART_16550,SPI_FLASH \
	" \
;

# Пример Использования в bash 3:
#make -f /PRT/R/digitalimagine/S/ТЛМЧ/1783120800000/СБР/СБР__РЗДЛ__ФРМ.make \
	AV_V__CL__K=x86_64 \
	KNG__VTCHN=digitalimagine \
	KNG__SKRP=КОБУРА \
	KNG__VM=1783120800000 \
	KNG__CHK_PT=ЗАРЯ \
	RZDL__S__FRM=" \
		/PRT/R/digitalimagine:1783120800000:DI_SVTCH,ТЛМЧ \
	" \
;

# Формат пакета: /ПУТЬ/К/РАЗДЕЛУ/ВОТЧИНЫ_А:ВРЕМЕННАЯ_МЕТА_А:СКРЕПА_А,СКРЕПА_Б /ПУТЬ/К/РАЗДЕЛУ/ВОТЧИНЫ_Б:ВРЕМЕННАЯ_МЕТА_Б:СКРЕПА_А
# Записи разделяются пробелом. Поля внутри одной записи разделяются двоеточием `:`, а список затребованных Скреп перечисляется через запятую `,`.



UD_OSN := /PRT/R/$(KNG__VTCHN):$(KNG__VM):$(KNG__SKRP)

UD_PS := /PRT/R/$(KNG__VTCHN)/P/$(AV_V__CL__K)/$(KNG__SKRP)/$(KNG__VM)/$(KNG__CHK_PT)/PS

_RZDL__S__FRM := $(UD_OSN) $(RZDL__S__FRM)



.PHONY: osn kntrl

osn: kntrl

kntrl:
	@printf "===========================================================================\n"
	@printf "||                          СБР: Параметры Сбора                         ||\n"
	@printf "===========================================================================\n"
	@printf "|| • Устои Воссоздания Сборных Разделов:                                 ||\n"
	@printf "||   • АВ_УКЛД    (Уклад АВ)          : %-32s ||\n" "$(AV_V__CL__K)"
	@printf "||   • ВТЧН       (Вотчина)           : %-32s ||\n" "$(KNG__VTCHN)"
	@printf "||   • ВМ         (Временная Мета)    : %-32s ||\n" "$(KNG__VM)"
	@printf "||   • СКРП       (Скрепа)            : %-32s ||\n" "$(KNG__SKRP)"
	@printf "||   • ЧК         (Чека)              : %-32s ||\n" "$(KNG__CHK_PT)"
	@printf "||   • ВТЧН_КЛВ   (Количество Вотчин) : %-32s ||\n" "$(words $(_RZDL__S__FRM))"
	@printf "===========================================================================\n"
	@\
	has_errors=0; \
	\
	# Правила цветового разграничения результатов надзора наличия разделов требуемых Скреп \
	C_RESET="\033[0m"; \
	C_GREEN="\033[0;32m"; \
	C_RED="\033[0;31m"; \
	C_CYAN="\033[0;36m"; \
	C_YELLOW="\033[0;33m"; \
	C_B_GREEN="\033[1;32m"; \
	C_B_RED="\033[1;31m"; \
	\
	DOT_GREEN="$${C_GREEN}●$${C_RESET}"; \
	DOT_RED="$${C_RED}●$${C_RESET}"; \
	DOT_CYAN="$${C_CYAN}●$${C_RESET}"; \
	DOT_YELLOW="$${C_YELLOW}●$${C_RESET}"; \
	\
	# ---------------------------------------------------------------------- \
	# ШАГ 1: КОНТРОЛЬ ВХОДНЫХ ПАРАМЕТРОВ \
	# ---------------------------------------------------------------------- \
	param_errors=0; \
	if [ -z "$(strip $(AV_V__CL__K))" ]; then echo "   $${DOT_RED} КРИТ-ОШИБКА: Переменная AV_V__CL__K пуста или не задана!"; param_errors=1; fi; \
	if [ -z "$(strip $(KNG__VTCHN))" ]; then echo "   $${DOT_RED} КРИТ-ОШИБКА: Переменная KNG__VTCHN пуста или не задана!"; param_errors=1; fi; \
	if [ -z "$(strip $(KNG__VM))" ]; then echo "   $${DOT_RED} КРИТ-ОШИБКА: Переменная KNG__VM пуста или не задана!"; param_errors=1; fi; \
	if [ -z "$(strip $(KNG__SKRP))" ]; then echo "   $${DOT_RED} КРИТ-ОШИБКА: Переменная KNG__SKRP пуста или не задана!"; param_errors=1; fi; \
	if [ -z "$(strip $(_RZDL__S__FRM))" ]; then echo "   $${DOT_RED} КРИТ-ОШИБКА: Массив _RZDL__S__FRM пуст или не задан!"; param_errors=1; fi; \
	\
	if [ $$param_errors -ne 0 ]; then \
		echo "$${C_B_RED}● ОШИБ: Ошиб Контроля Входных Параметров.$${C_RESET}"; \
		echo "   $${DOT_YELLOW} [КОНТРОЛЬ ПАРАМЕТРОВ]: Пуск Алгоритма [ПРЕКРАЩЁН]."; \
		echo "======================================================================"; \
		exit 1; \
	fi; \
	\
	# ---------------------------------------------------------------------- \
	# ШАГ 2: ОСНОВНОЙ КОНТРОЛЬ ТРЕБУЕМЫХ ВОТЧИН И СКРЕП \
	# ---------------------------------------------------------------------- \
	for repo_package in $(_RZDL__S__FRM); do \
		# Разбор Строки по двоеточию на три параметра \
		repo_path=$$(echo "$$repo_package" | cut -d':' -f1); \
		repo_vm=$$(echo "$$repo_package" | cut -d':' -f2); \
		deps_string=$$(echo "$$repo_package" | cut -d':' -f3); \
		\
		repo_name=$$(basename "$$repo_path"); \
		dir_s="$$repo_path/S"; \
		\
		echo "$${DOT_CYAN} Контроль Вотчины: [$$repo_name] (ВМ: $$repo_vm)"; \
		echo "   • Путь к Вотчине: $$repo_path"; \
		\
		# 1. Контроль указателя пути S текущей вотчины \
		if [ ! -d "$$dir_s" ] || [ -z "$$repo_path" ]; then \
			echo "   $${DOT_RED} ОШИБКА: Указатель Пути требуемой Скрепы не найден: $$dir_s"; \
			has_errors=1; \
			echo "----------------------------------------------------------------------"; \
			continue; \
		fi; \
		\
		# 2. Разбор Скрепы Вотчины (заменяем запятые на пробелы для цикла) \
		deps_list=$$(echo "$$deps_string" | tr ',' ' '); \
		\
		for dep in $$deps_list; do \
			expected_path="$$dir_s/$$dep/$$repo_vm"; \
			\
			if [ -d "$$expected_path" ]; then \
				echo "     $${DOT_GREEN} [$$dep] -> ДОБРО"; \
			else \
				echo "     $${DOT_RED} [$$dep] -> НЕ НАЙДЕН по ВМ $$repo_vm"; \
				echo "            Ожидаемый путь: $$expected_path"; \
				has_errors=1; \
			fi; \
		done; \
		echo "----------------------------------------------------------------------"; \
	done; \
	\
	# ---------------------------------------------------------------------- \
	# ШАГ 3: ЗАВЕРШАЮЩИЙ КОНТРОЛЬ \
	# ---------------------------------------------------------------------- \
	if [ $$has_errors -ne 0 ]; then \
		echo "$${C_B_RED}● ОШИБ: Ошиб Контроля Скрепы Вотчины.$${C_RESET}"; \
		echo "   $${DOT_YELLOW} [КОНТРОЛЬ СКРЕП]: Пуск Алгоритма [ПРЕКРАЩЁН]."; \
		echo "======================================================================"; \
		exit 1; \
	fi; \
	\
	echo "$${C_B_GREEN}● Контроль Вотчин завершён. Результат: успешно! Все Вотчины и Скрепы подтверждены.$${C_RESET}"; \
	echo "   Пуск алгоритма формирования Указателей Пути требуемых Скреп..."; \
	echo "----------------------------------------------------------------------"; \
	\
	# ---------------------------------------------------------------------- \
	# ШАГ 4: ФОРМИРОВАНИЕ УКАЗАТЕЛЙ ПУТИ \
	# ---------------------------------------------------------------------- \
	for repo_package in $(_RZDL__S__FRM); do \
		repo_path=$$(echo "$$repo_package" | cut -d':' -f1); \
		repo_vm=$$(echo "$$repo_package" | cut -d':' -f2); \
		deps_string=$$(echo "$$repo_package" | cut -d':' -f3); \
		\
		repo_name=$$(basename "$$repo_path"); \
		dir_s="$$repo_path/S"; \
		dir_ps_vtchn="$(UD_PS)/$$repo_name"; \
		\
		mkdir -p "$$dir_ps_vtchn"; \
		\
		deps_list=$$(echo "$$deps_string" | tr ',' ' '); \
		for dep in $$deps_list; do \
			expected_path="$$dir_s/$$dep/$$repo_vm"; \
			symlink_CL="$$dir_ps_vtchn/$$dep"; \
			\
			ln -snf "$$expected_path" "$$symlink_CL"; \
			echo "   🔗 Сформирован Указатель Пути [$$repo_name]: $$dep -> $$symlink_CL"; \
		done; \
	done; \
	echo "========================================================================"; \
	echo "$${C_B_GREEN}● Алгоритм Формирования Указательных Путей завершён. Результат: успешно!$${C_RESET}"; \
	echo "========================================================================"

