# B555 · Redes Neurais e Aprendizado Profundo

## Ambiente local no VS Code

1. Instale Python 3.11 ou 3.12 de 64 bits e as extensões **Python** e **Jupyter** no VS Code.
2. Abra esta pasta no VS Code. No Windows, selecione **Git Bash** no menu do terminal integrado. No Linux e no macOS com Apple Silicon, use o terminal com Bash.
3. Crie o ambiente e instale as dependências.

   ```bash
   bash setup.sh
   ```

4. Abra o notebook e use **Select Kernel → Python Environments** para escolher o Python da `.venv` desta pasta. Se precisar indicar o caminho, use `.venv/Scripts/python.exe` no Windows ou `.venv/bin/python` no macOS e no Linux.

Os exemplos das aulas 01 e 02 usam CPU e dados definidos nas próprias células. As duas atividades são individuais. Preencha o nome e a matrícula no notebook.

## Aula 01 · Fundamentos e propagação direta

- [Notebook da aula](aula01/aula01.ipynb). Leituras dos sensores em pandas, perceptron em NumPy e scikit-learn, e XOR em NumPy e TensorFlow/Keras.
- [Atividade](aula01/atividade01.ipynb). Código base para implementar OR e AND e comparar as saídas com ReLU e os erros em NumPy e Keras.

## Aula 02 · Aprendizagem e retropropagação

- [Notebook da aula](aula02/aula02.ipynb). Propagação direta, entropia cruzada binária, retropropagação em NumPy, conferência com `tf.GradientTape` e um passo de SGD com Keras.
- [Atividade](aula02/atividade02.ipynb). Código base para calcular e comparar gradientes e medir o efeito de um passo de SGD sobre a perda.
