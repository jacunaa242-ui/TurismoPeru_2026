#app.py

from flask import *

from models.cliente import Cliente
from models.persona import Persona

# Importaciones reales de tus controladores existentes
from controllers.listar_controller import listarclientes, listarpersonas
from controllers.persona_controller import insertar_persona

app = Flask(__name__)

@app.route("/")
def inicio():
    # Muestra la lista principal (puedes cambiar listarpersonas() por listarclientes() si prefieres)
    personas = listarpersonas()
    return render_template(
        "index.html",
        personas=personas
    )

@app.route("/clientes")
def client():
    clientes = listarclientes()
    return render_template(
        "clientes.html",
        clientes=clientes
    )

@app.route("/nuevo")
def nuevo():
    return render_template("insertar.html")

@app.route("/guardar", methods=["POST"])
def guardar():
    persona = Persona(
        request.form.get("tipo_persona"),
        request.form.get("nombres"),
        request.form.get("apaterno"),
        request.form.get("amaterno"),
        request.form.get("razon_social"),
        request.form.get("nombre_comercial"),
        request.form.get("id_tipo_documento"),
        request.form.get("numero_documento"),
        request.form.get("telefono"),
        request.form.get("email"),
        request.form.get("id_nacionalidad"),
        request.form.get("estado")
    )

    insertar_persona(persona)
    return redirect("/")

# ==============================================================================
# RUTAS EN CONSTRUCCIÓN
# Están comentadas para que VS Code NO te marque error de "función no definida".
# Descoméntalas cuando crees las funciones buscar, actualizar y eliminar en tu BD.
# ==============================================================================

# @app.route("/editar/<int:id>")
# def editar(id):
#     persona = buscar_cliente(id)
#     return render_template(
#         "editar.html",
#         persona=persona
#     )

# @app.route("/actualizar", methods=["POST"])
# def actualizar():
#     actualizar_cliente(
#         request.form["id"],
#         request.form["nombre"],
#         request.form["apellido"],
#         request.form["documento"]
#     )
#     return redirect("/")

# @app.route("/eliminar/<int:id>")
# def eliminar(id):
#     eliminar_cliente(id)
#     return redirect("/")

# SIEMPRE al final del archivo:
if __name__ == "__main__":
    app.run(debug=True)