class RelativesController < ApplicationController
    def index
        relative = Relative.order('created_at DESC');
        render json: {status: 'SUCCESS', message:'relative info Loaded', data: relative}, status: :ok
    end

    def indexuserid
        relative = Relative.where('user_id = ? ', params[:user_id]);
        render json: {status: 'SUCCESS', message:'relative info Loaded', data: relative}, status: :ok
    end
    
    def show
        relative = Relative.find_by(user_id: params[:user_id])
        render json: {status: 'SUCCESS', message:'Loaded relative Info', data: relative}, status: :ok
    end

    def showfamiliar
        relative = Relative.where("user_id = ? AND tipo_familiar= ?", params[:user_id],params[:tipo_familiar])
        render json: {status: 'SUCCESS', message:'Loaded relative Info', data: relative}, status: :ok
    end
    
    def mycreate
        relative =  Relative.new(relative_params)
        
        if relative.save
            render json: {status: 'SUCCESS', message:'Saved relative Info', data: relative}, status: :ok
        else
            render json: {status: 'ERROR', message:'relative Info Not Saved', data: relative.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        relative = Relative.find(params[:id])
        relative.destroy

        render json: {status: 'SUCCESS', message:'Deleted relative Info', data: relative}, status: :ok
    end

    def myupdate
        relative = Relative.where("user_id = ? AND tipo_familiar= ?", params[:user_id],params[:tipo_familiar])
        #relative = Relative.find_by(params[:user_id], params[:tipo_familiar])
        if relative.update(relative_params)
            render json: {status: 'SUCCESS', message:'Updated relative Info', data: relative}, status: :ok
        else
            render json: {status: 'ERROR', message:'Update Not Saved', data: relative.errors}, status: :unprocessable_entity
        end
    end


    private

    def relative_params
        params.require(:relative).permit(
   :tipo_familiar,
   :tipo_documento_familiar,
   :documento_familiar,
   :primer_nombre_familiar,
   :segundo_nombre_familiar,
   :primer_apellido_familiar,
   :segundo_apellido_familiar,
   :fecha_nacimiento_familiar,
   :esta_vivo_familiar,
   :estado_civil_familiar,
   :tiene_cedula_militar_familiar,
   :direccion_familiar,
   :pais_familiar,
   :departamento_familiar,
   :municipio_familiar,
   :telefono_familiar,
   :esta_trabajando_familiar,
   :nombre_trabajo_familiar,
   :empresa_trabajo_familiar,
   :cargo_trabajo_familiar,
   :tipo_trabajador_familiar,
   :fecha_ingreso_trabajo_familiar,
   :direccion_trabajo_familiar,
   :pais_trabajo_familiar,
   :departamento_trabajo_familiar,
   :municipio_trabajo_familiar,
   :telefono_trabajo_familiar,
   :user_id,
   :documento_identidad 
            )
    end
end