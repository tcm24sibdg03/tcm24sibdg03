import {
  Count,
  CountSchema,
  Filter,
  FilterExcludingWhere,
  repository,
  Where,
} from '@loopback/repository';
import {
  post,
  param,
  get,
  getModelSchemaRef,
  patch,
  put,
  del,
  requestBody,
  response,
} from '@loopback/rest';
import {Veiculo} from '../models';
import {VeiculoRepository} from '../repositories';

export class VeiculoController {
  constructor(
    @repository(VeiculoRepository)
    public veiculoRepository : VeiculoRepository,
  ) {}

  @post('/veiculos')
  @response(200, {
    description: 'Veiculo model instance',
    content: {'application/json': {schema: getModelSchemaRef(Veiculo)}},
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Veiculo, {
            title: 'NewVeiculo',
            exclude: ['id'],
          }),
        },
      },
    })
    veiculo: Omit<Veiculo, 'id'>,
  ): Promise<Veiculo> {
    return this.veiculoRepository.create(veiculo);
  }

  @get('/veiculos/count')
  @response(200, {
    description: 'Veiculo model count',
    content: {'application/json': {schema: CountSchema}},
  })
  async count(
    @param.where(Veiculo) where?: Where<Veiculo>,
  ): Promise<Count> {
    return this.veiculoRepository.count(where);
  }

  @get('/veiculos')
  @response(200, {
    description: 'Array of Veiculo model instances',
    content: {
      'application/json': {
        schema: {
          type: 'array',
          items: getModelSchemaRef(Veiculo, {includeRelations: true}),
        },
      },
    },
  })
  async find(
    @param.filter(Veiculo) filter?: Filter<Veiculo>,
  ): Promise<Veiculo[]> {
    return this.veiculoRepository.find(filter);
  }

  @patch('/veiculos')
  @response(200, {
    description: 'Veiculo PATCH success count',
    content: {'application/json': {schema: CountSchema}},
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Veiculo, {partial: true}),
        },
      },
    })
    veiculo: Veiculo,
    @param.where(Veiculo) where?: Where<Veiculo>,
  ): Promise<Count> {
    return this.veiculoRepository.updateAll(veiculo, where);
  }

  @get('/veiculos/{id}')
  @response(200, {
    description: 'Veiculo model instance',
    content: {
      'application/json': {
        schema: getModelSchemaRef(Veiculo),
      },
    },
  })
  async findById(
    @param.path.number('id') id: number
  ): Promise<Veiculo> {
    return this.veiculoRepository.findById(id);
  }

  @patch('/veiculos/{id}')
  @response(204, {
    description: 'Veiculo PATCH success',
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Veiculo, {partial: true}),
        },
      },
    })
    veiculo: Veiculo,
  ): Promise<void> {
    await this.veiculoRepository.updateById(id, veiculo);
  }

  @put('/veiculos/{id}')
  @response(204, {
    description: 'Veiculo PUT success',
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() veiculo: Veiculo,
  ): Promise<void> {
    await this.veiculoRepository.replaceById(id, veiculo);
  }

  @del('/veiculos/{id}')
  @response(204, {
    description: 'Veiculo DELETE success',
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.veiculoRepository.deleteById(id);
  }
}
