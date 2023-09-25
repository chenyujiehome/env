if ! ( [ -d ./FA2_repository ] && [ -d ./FA1_repository ] ); then
echo "clone repository"
git clone https://github.com/Dao-AILab/flash-attention.git
rm -rf ./flash-attention/.git/
mv ./flash-attention/ ./FA2_repository/
git clone https://github.com/Dao-AILab/flash-attention.git
cd flash-attention
git checkout tags/v1.0.9
cd ..
rm -rf ./flash-attention/.git/
mv ./flash-attention/ ./FA1_repository/
fi
pip install packaging
pip install  ninja
pip install flash-attn --no-build-isolation
pip install einops
proxy_off
pip install xformers
pip install triton
mkdir .vscode
echo '
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Python: step out my code",
            "type": "python",
            "request": "launch",
            "program": "${file}",
            "console": "integratedTerminal",
            "justMyCode": false
        },
        {
            "name": "Python: Current File",
            "type": "python",
            "request": "launch",
            "program": "${file}",
            "console": "integratedTerminal",
            "justMyCode": true
        }
    ]
}'>./.vscode/launch.json
proxy_on