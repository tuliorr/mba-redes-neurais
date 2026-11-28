# B555 · Redes Neurais e Aprendizado Profundo

## Instalação e execução no VS Code

Use Git, Python **3.11 ou 3.12** de 64 bits e o VS Code com as extensões **Python** e **Jupyter**. A GPU é opcional.

### CPU

No Windows, abra o **Git Bash**. No Linux ou macOS com Apple Silicon, use um terminal Bash. Clone o repositório e execute o setup padrão.

```bash
git clone https://github.com/tuliorr/mba-redes-neurais.git
cd mba-redes-neurais
bash setup.sh
code .
```

### GPU NVIDIA no WSL2

Tenha uma GPU NVIDIA compatível com CUDA, o driver NVIDIA no Windows e a extensão **WSL** no VS Code. Se precisar instalar o Ubuntu, rode `wsl --install -d Ubuntu` no PowerShell como administrador. Use `wsl -l -v` para confirmar que o Ubuntu está na versão **2**. [Instalação do WSL](https://learn.microsoft.com/pt-br/windows/wsl/install) · [CUDA no WSL](https://docs.nvidia.com/cuda/wsl-user-guide/index.html)

No terminal do Ubuntu, confira se a GPU aparece em `nvidia-smi`. Se o comando não estiver no `PATH`, use `/usr/lib/wsl/lib/nvidia-smi`. Clone o repositório no Ubuntu.

```bash
cd ~
git clone https://github.com/tuliorr/mba-redes-neurais.git
cd mba-redes-neurais
```

Confira a versão com `python3 --version`. Se faltar o módulo `venv`, instale `python3-venv` no Ubuntu. Se o `python3` for de outra versão, crie a `.venv` com Python 3.12 antes do setup. Com o `uv` instalado, rode `uv venv --python 3.12 --seed .venv`. [Instalação do uv](https://docs.astral.sh/uv/getting-started/installation/)

```bash
bash setup.sh --gpu
code .
```

Confirme que o VS Code abriu a pasta em **WSL: Ubuntu** e instale as extensões **Python** e **Jupyter** nesse ambiente se solicitado. [VS Code no WSL](https://code.visualstudio.com/docs/remote/wsl)

### Abrir o notebook

Abra o `.ipynb` e, em **Select Kernel → Python Environments**, selecione o Python da `.venv` do repositório. O caminho é `.venv/Scripts/python.exe` no Windows nativo e `.venv/bin/python` no Linux, WSL2 e macOS. Execute as células em ordem.

Na Aula 03, o TensorFlow e o PyTorch usam a GPU quando disponível. Para forçar CPU, execute `import os` e `os.environ["CUDA_VISIBLE_DEVICES"] = "-1"` em um kernel recém-iniciado, antes de importar os frameworks.

Para conferir se o kernel detecta a GPU, execute a célula abaixo.

```python
import tensorflow as tf
import torch

print(tf.config.list_physical_devices("GPU"))
print(torch.cuda.is_available())
```

Com CUDA disponível, o TensorFlow lista pelo menos uma GPU e o PyTorch imprime `True`.

Os exemplos das aulas 01 e 02 usam CPU e dados definidos nas próprias células. As duas atividades são individuais. Preencha o nome e a matrícula no notebook.

## Aula 01 · Fundamentos e propagação direta

- [Notebook da aula](aula01/aula01.ipynb). Leituras dos sensores em pandas, perceptron em NumPy e scikit-learn, e XOR em NumPy e TensorFlow/Keras.
- [Atividade](aula01/atividade01.ipynb). Código base para implementar OR e AND e comparar as saídas com ReLU e os erros em NumPy e Keras.

## Aula 02 · Aprendizagem e retropropagação

- [Notebook da aula](aula02/aula02.ipynb). Propagação direta, entropia cruzada binária, retropropagação em NumPy, conferência com `tf.GradientTape` e um passo de SGD com Keras.
- [Atividade](aula02/atividade02.ipynb). Código base para calcular e comparar gradientes e medir o efeito de um passo de SGD sobre a perda.

## Aula 03 · Treinamento de uma MLP

- [Notebook da aula](aula03/aula03.ipynb). Treinamento da mesma rede em NumPy, TensorFlow/Keras e PyTorch com dados da Olist, curvas de perda, Average Precision e recuperação dos pesos para inferência.
- [Atividade](aula03/atividade03.ipynb). Trabalho individual sobre preparação dos dados, treinamento e comparação de modelos. A célula inicial abre as tabelas. Preencha o nome e a matrícula no notebook.

Os dois notebooks leem os CSVs em `dados/brutos/`. Em um clone novo, baixe o ZIP da [publicação da Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) e extraia `olist_orders_dataset.csv`, `olist_order_items_dataset.csv` e `olist_customers_dataset.csv` diretamente nessa pasta.
