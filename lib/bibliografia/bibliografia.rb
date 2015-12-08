module Bibliografia

 Node = Struct.new(:value, :next,:anterior) #define una estructura indicando los campos que contendrá

    class Bibliografia
	include Comparable
        
	attr_reader :autores, :titulo, :edicion, :numeroedicion, :serie, :fecha, :isbn

        def initialize(autores, titulo, serie, edicion, numeroedicion,fecha,isbn)
            @autores = autores
		raise ArgumentError, 'Specify :autores' unless @autores
            @titulo = titulo
		raise ArgumentError, 'Specify :titulo' unless @titulo
            @serie = serie
		raise ArgumentError, 'Specify :serie' unless @serie
            @edicion = edicion
		raise ArgumentError, 'Specify :edicion' unless @edicion
            @numeroedicion = numeroedicion
		raise ArgumentError, 'Specify :numeroedicion' unless @numeroedicion
            @fecha = fecha
		raise ArgumentError, 'Specify :fecha' unless @fecha
            @isbn = isbn
		raise ArgumentError, 'Specify :isbn' unless @isbn
        end

        def cantidadAutores()
            @autores.length()
        end

        def hasTitulo
            if @titulo then
                true
            else
                false
            end
        end

        def cantidadSeries
            if @serie!= nil then
                1
            else
                0
            end
        end

        def hasEdicion
            if @edicion then
                true
            else
                false
            end
        end

        def hasNumeroedicion
            if @numeroedicion then
                true
            else
                false
            end
        end

        def hasFecha
            if @fecha then
                true
            else
                false
            end
        end

        def cantidadIsbn
            @isbn.length
        end

        #se incluye el operador del mixin comparable
    	def <=>(anOther)
      	autores.size <=> anOther.autores.size
    	end
	
	def ==(anOther)
      	   if autores.size == anOther.autores.size
	      return true
           else #si no son iguales
	      return false	
           end
        end
    
       
    
        def < (anOther)
           if numeroedicion.size < anOther.numeroedicion.size
	     return true
           else #si no son iguales
	     return false	
           end
        end
    
        def >(anOther)
           if numeroedicion.size > anOther.numeroedicion.size
	     return true
           else #si no son iguales
	     return false	
           end
        end

    end#end de la clase bibliografia

class Lista

    include Enumerable
     attr_accessor :cabeza , :tail
     
    @cabeza = nil
    @tail = nil
    
     def each
      temp=@cabeza
      while (temp!=@tail)do
	yield temp.value
	temp=temp.next
     	end
     end

     def push(nodo)
       if @cabeza == nil
	 @cabeza = nodo
	 @tail = nodo
       else #si cabeza apunta algun nodo
	nodo.next = @cabeza
	@cabeza.anterior = nodo
	@cabeza = nodo
	nodo.anterior = nil
	#@cabeza.anterior = nil
	#@cabeza.next = nodo.next
       end
    end
        
      def pop()
	  if (@cabeza != @tail)#si la lista tiene mas de un elemento
	    aux = @cabeza
	    @cabeza = @cabeza.next
	    @cabeza.anterior = nil
	    aux.next = nil
	    aux.value
	  else
	    @cabeza = nil
	    @tail = nil
	    
	  end
     end
     
     def push_final(nodo)
       if @tail == nil
	 @tail = nodo
	 @cabeza = nodo
       else
	  @tail.next = nodo
	  nodo.anterior = @tail
	  @tail = nodo
       end
     end
     
     def pop_final()
       if (@cabeza != @tail)#si la lista tiene mas de un elemento
	    aux = @tail
	    @tail = @tail.anterior
	    @tail.next = nil
	    aux.anterior = nil
	    aux.value
	  else
	    @cabeza = nil
	    @tail = nil
	  end
     end
    
  end#end de la clase lista

	class Libro < Bibliografia
		def to_s
		"Libros\n"+super
		end
	end#end de la clase libros


	class LibroElec < Bibliografia
		def to_s
		"Libros Electronico\n"+super
		end
	end#end de la clase librosElec


	class Periodico < Bibliografia
		def to_s
		"Periodico\n"+super
		end
	end#end de la clase Periodico

	class APABibliografia < Bibliografia
		attr_accessor :nombres, :apellidos, :tipo, :lugar
		
		def initialize(args)
			@nombres =args[:nombres]
			raise ArgumentError, 'Specify :nombres' unless @nombres
			@apellidos=args[:apellidos]
			raise ArgumentError, 'Specify :apellidos' unless @apellidos
			@tipo=args[:tipo]
			raise ArgumentError, 'Specify :tipo' unless @tipo
			@lugar=args[:lugar]
			raise ArgumentError, 'Specify :lugar' unless @lugar
			
		end
		
	end#end de la clase APABibliografia
	
end
