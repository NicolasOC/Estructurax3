class Node
	attr_accessor:nombre,:direccion,:numero,:ciudad,:left,:right,:dif,:altura, :padre
	def initialize(nombre,direccion,numero,ciudad)
		@nombre=nombre
		@direccion=direccion
		@numero=numero
		@ciudad=ciudad
		@left=nil
		@right=nil
		@padre=nil
		@altura=nil
		@dif=nil
	end
	def diferencia
		if @right==nil && @left==nil
			@dif=0
		elsif @right==nil && @left!=nil	
			@dif=@left.altura
		elsif @left==nil && @right!=nil
			@dif=@right.altura
		else
			@dif=@right.altura-@left.altura
		end
		return @dif
	end	
end
class AVL
	attr_reader:root
	def initialize
		@root=nil
	end
	def agregar(nombre,direccion,numero,ciudad)
		if @root==nil
			@root=Node.new(nombre,direccion,numero,ciudad)
			@root.altura=0
			@root.dif=0
			return 
		else
			agregador(nombre,direccion,numero,ciudad,@root, 1)
		end

	end
	def agregador(nombre, direccion, numero, ciudad ,nodo, altura)
		if nombre>nodo.nombre
			if nodo.right==nil
				nodo.right=Node.new(nombre, direccion, numero, ciudad)
				nodo.right.padre=nodo
				nodo.right.altura=altura	
				calculador_altura(nodo.right)						
			else
				agregador(nombre, direccion, numero, ciudad, nodo.right, altura+1)
			end
		else
			if nodo.left=nil
				nodo.left=Node.new(nombre, direccion, numero, ciudad)
				nodo.left.padre=nodo
				nodo.left.altura=altura	
				calculador_altura(nodo.left)
			else
				agregador(nombre, direccion, numero, ciudad, nodo.left, altura+1)
			end
		end
	end
	def calculador_altura(nodo)
		dif=nodo.padre.diferencia
		if dif==-1
			calculador_altura(nodo.padre)
		elsif dif==0
			return
		elsif dif==1
			calculador_altura(nodo.padre)
		else
			#aqui usare los giros, luego lo programare
		end
	end
	def reparador_derecho(nodo)
		
		if nodo.padre.alturader > nodo.padre.alturaizq
			nodo.padre.altura=nodo.padre.altura+1
		elsif nodo.padre.alturader < nodo.padre.alturaizq
			return
		elsif (nodo.padre.alturader - nodo.padre.alturaizq).abs > 1
			#preparar giro
		else
			reparador_derecho(nodo.padre)
		end
	end
	def buscador(apellido)
		if apellido>@root.apellido
			ayudante_busqueda(apellido,@root.right)
		elsif apellido<@root.apellido
			ayudante_busqueda(apellido,@root.left)
		else
			print @root
			ayudante_busqueda(apellido,@root.left)
		end
	end
	def ayudante_busqueda(apellido,nodo)
		if apellido>nodo.apellido
			ayudante_busqueda(apellido, nodo.right)
		elsif apellido<nodo.apellido
			ayudante_busqueda(apellido, nodo.left)
		elsif apellido==nodo.apellido
			print nodo
			ayudante_busqueda(apellido, nodo.left)
		else
			return
		end
	end
	def eliminador(apellido)
		if apellido>@root.apellido
			ayudante_eliminador(apellido, @root.right)
		elsif apellido<@root.apellido
			ayudante_eliminador(apellido, @root.left)
		else
			#borrar el nodo
		end
	end
	def ayudante_eliminador(apellido, nodo)
		if apellido>nodo.apellido
			ayudante_eliminador(apellido, nodo.right)
		elsif apellido<nodo.apellido
			ayudante_eliminador(apellido, nodo.left)
		else 
			#borrar el nodo
		end
	end

end
