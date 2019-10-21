#!/bin/sh
# The shell script for unzipping dataset
DEFAULT_PATH="/root/bk/datasets"  # !! Modify this path !!
ANNOTATION="Annotation"
ASTROPHYSICS="Astrophysics"
RAPISCAN="Rapiscan"
SMITH="Smith"
FIRST_DANGEROUS="first_dangerous"
SECOND_STORAGE="second_storage"

mkdir ${DEFAULT_PATH}/${ANNOTATION} ${DEFAULT_PATH}/${ASTROPHYSICS} ${DEFAULT_PATH}/${RAPISCAN} ${DEFAULT_PATH}/${SMITH}

#===================================================================================================================================#

# Unzip at ./first_dangerous

###
# AstropgysicsHDD.zip           AstropgysicsTabletPC.zip  RapiscanSSD.zip         SmithHDD_External.zip  SmithUSB.zip
# AstropgysicsHDD_External.zip  AstropgysicsUSB.zip       RapiscanSmartPhone.zip  SmithLapTop.zip        download.sh
# AstropgysicsLapTop.zip        RapiscanHDD.zip           RapiscanTabletPC.zip    SmithSSD.zip
# AstropgysicsSSD.zip           RapiscanHDD_External.zip  RapiscanUSB.zip         SmithSmartPhone.zip
# AstropgysicsSmartPhone.zip    RapiscanLapTop.zip        SmithHDD.zip            SmithTabletPC.zip
###
FIRST_DANGEROUS_ASTROPHYSICS_ORDER="AstropgysicsHDD.zip AstropgysicsHDD_External.zip AstropgysicsLapTop.zip AstropgysicsSSD.zip AstropgysicsSmartPhone.zip AstropgysicsTabletPC.zip AstropgysicsUSB.zip"
FIRST_DANGEROUS_RAPISCAN_ORDER="RapiscanHDD.zip RapiscanHDD_External.zip RapiscanLapTop.zip RapiscanSSD.zip RapiscanSmartPhone.zip RapiscanTabletPC.zip RapiscanUSB.zip"
FIRST_DANGEROUS_SMITH_ORDER="SmithHDD.zip SmithHDD_External.zip SmithLapTop.zip SmithSSD.zip SmithSmartPhone.zip SmithTabletPC.zip SmithUSB.zip"

echo "In 'first_dangerous' directory ..."

# Astrophysics
echo "Unzipping Astrophysics ..."
for order in ${FIRST_DANGEROUS_ASTROPHYSICS_ORDER}
do
    unzip -q "./${FIRST_DANGEROUS}/${order}" -d "${DEFAULT_PATH}/${ASTROPHYSICS}"
done
echo "Done"

# Rapiscan
echo "Unzipping Rapiscan ..."
for order in ${FIRST_DANGEROUS_RAPISCAN_ORDER}
do
    unzip -q "./${FIRST_DANGEROUS}/${order}" -d "${DEFAULT_PATH}/${RAPISCAN}"
done
echo "Done"

# Smith
echo "Unzipping Smith ..."
for order in ${FIRST_DANGEROUS_SMITH_ORDER}
do
    unzip -q "./${FIRST_DANGEROUS}/${order}" -d "${DEFAULT_PATH}/${SMITH}"
done
echo "Done"

#===================================================================================================================================#

# Unzip at ./second_storage

###
# Annotation.zip                        RapiscanKnife.zip                 SmithLighter.zip
# AstrophysicsAerosol.zip               RapiscanLighter.zip               SmithLiquid.zip
# AstrophysicsKnife.zip (x)                 RapiscanLiquid.zip                SmithScissors.zip
# AstrophysicsLighter.zip               RapiscanScrewdriver.zip           SmithScrewdriver.zip
# AstrophysicsScissors.zip              RapiscanSpanner.zip               SmithSpanner.zip
# AstrophysicsSpanner.zip               RapiscanSupplymentaryBattery.zip  SmithSupplymentaryBattery.zip
# AstrophysicsSupplymentaryBattery.zip  SmithAerosol.zip                  download.sh
# RapiscanAerosol.zip                   SmithHammer.zip
# RapiscanHammer.zip                    SmithKnife.zip (x)
###
SECOND_STORAGE_ASTROPHYSICS_ORDER="AstrophysicsAerosol.zip AstrophysicsLighter.zip AstrophysicsScissors.zip AstrophysicsSpanner.zip AstrophysicsSupplymentaryBattery.zip"
SECOND_STORAGE_RAPISCAN_ORDER="RapiscanAerosol.zip RapiscanHammer.zip RapiscanKnife.zip RapiscanLighter.zip RapiscanLiquid.zip RapiscanScrewdriver.zip RapiscanSpanner.zip RapiscanSupplymentaryBattery.zip"
SECOND_STORAGE_SMITH_ORDER="SmithAerosol.zip SmithHammer.zip SmithLighter.zip SmithLiquid.zip SmithScissors.zip SmithScrewdriver.zip SmithSpanner.zip SmithSupplymentaryBattery.zip"

echo "In 'second_storage' directory ..."

# Annotation
unzip -q "./${SECOND_STORAGE}/Annotation.zip" -d "${DEFAULT_PATH}/${ANNOTATION}"

# Astrophysics
echo "Unzipping Astrophysics ..."
for order in ${SECOND_STORAGE_ASTROPHYSICS_ORDER}
do
    unzip -q "./${SECOND_STORAGE}/${order}" -d "${DEFAULT_PATH}/${ASTROPHYSICS}"
done
echo "Done"

# Rapiscan
echo "Unzipping Rapiscan ..."
for order in ${SECOND_STORAGE_RAPISCAN_ORDER}
do
    unzip -q "./${SECOND_STORAGE}/${order}" -d "${DEFAULT_PATH}/${RAPISCAN}"
done
echo "Done"

# Smith
echo "Unzipping Smith ..."
for order in ${SECOND_STORAGE_SMITH_ORDER}
do
    unzip -q "./${SECOND_STORAGE}/${order}" -d "${DEFAULT_PATH}/${SMITH}"
done
echo "Done"

#===================================================================================================================================#

# Unzip with exception cases
echo "Unzipping exception cases ..."

# ./second_storage/AstrophysicsKnife.zip
echo "Unzipping ./second_storage/AstrophysicsKnife.zip ..."
mkdir "./Knife"
mkdir "./Knife/Multiple_Categories" "./Knife/Multiple_Other" "./Knife/Single_Default" "./Knife/Single_Other"
jar -xvf "./${SECOND_STORAGE}/AstrophysicsKnife.zip"
mv "./Knife" "${DEFAULT_PATH}/${ASTROPHYSICS}"
echo "Done"

# ./second_storage/SmithKnife.zip
echo "Unzipping ./second_storage/SmithKnife.zip ..."
mkdir "./Knife"
mkdir "./Knife/Multiple_Categories" "./Knife/Multiple_Other" "./Knife/Single_Default" "./Knife/Single_Other"
jar -xvf "./${SECOND_STORAGE}/SmithKnife.zip"
mv "./Knife" "${DEFAULT_PATH}/${SMITH}"
echo "Done"
