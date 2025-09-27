export PYNAME=imRender
rm -rf build
rm -rf dist
rm -rf $PYNAME.egg-info
pip uninstall $PYNAME -y
python -m build -sw -nx
pip install dist/*.whl

#twine upload dist/*