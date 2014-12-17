#!/system/bin/sh
# PROJECT MOD BOOST EDITION  
# NITRO X ENGINE SERIES
# VERSION SPARK EDITION
# DEV BY K1KS
# BACKUP 
#=======================================================================#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#  You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.
#=======================================================================#

# Mount R/W System
mount -o remount,rw /system;

# Backup Init.d
if [ -e /system/etc/init.d.bak ]; then
echo ">>>...Init.d Backup Already Present...<<<";
else
cp -r /system/etc/init.d /system/etc/init.d.bak;
chmod -R 000 /system/etc/init.d.bak;
chown 0.0 /system/etc/init.d.bak;
fi;

# Egl/Libgles
if [ -s /system/lib/egl/libGLES_android.so ]
then
rm -r /system/lib/egl/libGLES_android.so
else
echo ">>>..No Libgles_Android...<<<";
fi;
if [ -s /system/lib/egl/egl.cfg ]
then
busybox sed -i '/0 0 android/d' /system/lib/egl/egl.cfg
else
echo ">>>...No egl.cfg...<<<";
fi;




