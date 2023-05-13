mkdir /opt/OpenCortex/
cd /opt/OpenCortex/
curl -L https://github.com/OpenCortex-Research/ZenBrew/releases/download/V0.1/ZenBrew-0_1_2.tar.gz -o ZenBrew-0_1_2.tar.gz
gunzip ZenBrew-0_1_2.tar.gz
tar -xf ZenBrew-0_1_2.tar
rm ZenBrew-0_1_2.tar
ln -s /opt/OpenCortex/ZenBrew/main.py /bin/zenbrew
ln -s /opt/OpenCortex/ZenBrew/main.py /usr/bin/zenbrew
chmod +x /opt/OpenCortex/ZenBrew/main.py
chmod +x /bin/zenbrew
chmod +x /usr/bin/zenbrew