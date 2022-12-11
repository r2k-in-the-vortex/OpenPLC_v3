cd core
#LIBS=`pkg-config --cflags --libs libmodbus -lasiodnp3 -lasiopal -lopendnp3 -lopenpal`
# compile plc
cd runtime/ 
rustyc -c -g -o PLC.o --hardware-conf json ../../st_files/rustysample.st
cd ..

# generate variables header
python3 varlocator.py

# compile openplc
g++ -std=gnu++11 *.cpp -c -I ./lib -I runtime -pthread -fpermissive `pkg-config --cflags --libs libmodbus` -lasiodnp3 -lasiopal -lopendnp3 -lopenpal -w -D _rusty
mv *.o runtime/

# link openplc
g++ runtime/*.o -o openplc `pkg-config --cflags --libs libmodbus` -lasiodnp3 -lasiopal -lopendnp3 -lopenpal
mv openplc runtime/openplc

cd ..