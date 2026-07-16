# =====================================================================
# D I G I T A L   I M A G I N E .   Т О Л М А Ч .   С Б О Р
# Скрипт сборки образа холодного пуска задачи "Заря" под rv64gc
# Чистый конвейер: весь промежуточный софт скрыт внутри папки Сборки
# =====================================================================

#make -f /PRT/R/digitalimagine/S/ТЛМЧ/1783120800000/СБР/ТЛМЧ__СБР.make AV_V__HOST__K=x86_64 AV_V__TARGET__K=x86_64 run YAZK_CSV="/PRT/R/digitalimagine/S/КОБУРА/1783120800000/ЗАРЯ/ЗАРЯ__ТЛМЧ.csv:/PRT/R/digitalimagine/S/КОБУРА/1783120800000/ЗАРЯ"

__AV_V__HOST=_AV__V__x86_64
__AV_V__TARGET=_AV__V__RV64GC

KNG__VTCHN=digitalimagine
KNG__VM=1783120800000
KNG__SKRP=ТЛМЧ
KNG__CHK_PT=



# Автоматическое отрезание префиксов для путей экосистемы
AV_V__HOST__K		?=	$(subst _AV__V__,,$(__AV_V__HOST))
AV_V__TARGET__K		?=	$(subst _AV__V__,,$(__AV_V__TARGET))

PS_UD := /PRT/R/$(KNG__VTCHN)/P/$(AV_V__HOST__K)/$(KNG__SKRP)/$(KNG__VM)/$(KNG__CHK_PT)/PS



# ==============================================================================
# ГЕНЕРАЦИЯ ЕДИНОГО НЕИЗМЕННОГО КОРНЯ СБОРКИ СВТЧ
# ==============================================================================ч

PS_UD := /PRT/R/$(KNG__VTCHN)/P/$(AV_V__HOST__K)/$(KNG__SKRP)/$(KNG__VM)/$(KNG__CHK_PT)/PS


# 2. Финальный контроль результирующей строки пути PS_UD. 
# Защищает от ситуаций, когда путь превращается в кривую кашу из-за сбоя структуры.
# ==============================================================================
ifeq ($(strip $(PS_UD)),)
$(error 💥 ФАТАЛЬНЫЙ СБОЙ: Расчет строки пути [PS_UD] завершился критической пустотой!)
endif
#ifneq ($(strip $(PS_UD)),)
#$(error 💥 СВТЧ.КОНТРОЛЬ: Сформированная строка пути [AV_V__TARGET__K] => $(AV_V__TARGET__K))
#$(error 💥 СВТЧ.КОНТРОЛЬ: Сформированная строка пути [PS_UD] => $(PS_UD))
#endif






# 1. Жёсткая привязка паспорта путей вашей экосистемы
RZDL_TLMCH__S	:= /PRT/R/$(KNG__VTCHN)/S/$(KNG__SKRP)/${KNG__VM}
RZDL_TLMCH__P	:= /PRT/R/$(KNG__VTCHN)/P/${AV_V__TARGET__K}/$(KNG__SKRP)/${KNG__VM}
RZDL_TLMCH__Q	:= /PRT/R/$(KNG__VTCHN)/Q/${AV_V__TARGET__K}/$(KNG__SKRP)/${KNG__VM}
RZDL_TLMCH__R	:= /PRT/R/$(KNG__VTCHN)/R/${AV_V__TARGET__K}/$(KNG__SKRP)/${KNG__VM}



# ПУТИ АВТОМАТИЗАЦИИ КОДОГЕНЕРАТОРА КВ (ДОБАВЛЕНО)
SRC_TLMCH__KV	:= $(RZDL_TLMCH__S)/$(KNG__SKRP).c
DIR_TLMCH__KV	:= /PRT/R/$(KNG__VTCHN)/P/${AV_V__HOST__K}/$(KNG__SKRP)/${KNG__VM}
BIN_TLMCH__KV	:= $(DIR_TLMCH__KV)/$(KNG__SKRP).zdch



DEPS	:= $(BIN_TLMCH__KV:.zdch=.d)



EXTERNAL_STAMP := $(DIR_TLMCH__KV)/.external_make.stamp



.PHONY: all run clean

all: $(BIN_TLMCH__KV)



$(EXTERNAL_STAMP):
	@mkdir -p $(DIR_TLMCH__KV)
	$(MAKE) -f $(RZDL_TLMCH__S)/СБР/СБР__РЗДЛ__ФРМ.make \
		AV_V__TARGET__K=$(AV_V__TARGET__K) \
		KNG__VTCHN=$(KNG__VTCHN) \
		KNG__SKRP=$(KNG__SKRP) \
		KNG__VM=$(KNG__VM) \
		RZDL__S__FRM=" /PRT/R/$(KNG__VTCHN):$(KNG__VM):DI_SVTCH,$(KNG__SKRP) "
	@touch $(EXTERNAL_STAMP)



$(BIN_TLMCH__KV): $(EXTERNAL_STAMP) $(SRC_TLMCH__KV)
	@gcc $(SRC_TLMCH__KV) -o $(BIN_TLMCH__KV) \
		-Wall -Wextra -Wpedantic -Werror -Wshadow \
		-O2 \
	\
		-MMD -MP -MT $(BIN_TLMCH__KV) \
	\
		-D_KNG__VTCHN=\"$(KNG__VTCHN)\" \
		-D_KNG__SKRP=\"${KNG__SKRP}\" \
		-D_KNG__VM=${KNG__VM} \
		-D_AV__V__${AV_V__TARGET__K} \
		-D_AV__RD__QEMU \
		-D_ZN__KOBURA \
		-D_OBLST__ZARYA \
		-I$(PS_UD)

-include $(DEPS)



run: $(BIN_TLMCH__KV)
	$(BIN_TLMCH__KV) $(YAZK_CSV) $(YAZK_ASM)



# Рекомендуется добавить очистку маркера в clean
clean:
	rm -f $(BIN_TLMCH__KV) $(EXTERNAL_STAMP)