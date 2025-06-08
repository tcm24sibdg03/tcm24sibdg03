import {
  repository,
} from '@loopback/repository';
import {
  post,
  param,
  get,
  patch,
  requestBody,
  HttpErrors,
} from '@loopback/rest';
import {Inclui} from '../models';
import {IncluiRepository} from '../repositories';

export class IncluiController {
  constructor(
    @repository(IncluiRepository)
    public incluiRepository: IncluiRepository,
  ) {}

  @get('/agendamentos/{agendamentoId}/servicos', {
    responses: {
      '200': {
        description: 'Lista de serviços incluídos num agendamento',
        content: {'application/json': {schema: {type: 'array', items: {'x-ts-type': Inclui}}}},
      },
    },
  })
  async findServicosPorAgendamento(
    @param.path.number('agendamentoId') agendamentoId: number,
  ): Promise<Inclui[]> {
    return this.incluiRepository.find({where: {agendamentoId}});
  }

  @post('/agendamentos/{agendamentoId}/servicos/{servicoId}', {
    responses: {
      '200': {
        description: 'Serviço adicionado ao agendamento',
        content: {'application/json': {schema: {'x-ts-type': Inclui}}},
      },
    },
  })
  async adicionarServicoAoAgendamento(
    @param.path.number('agendamentoId') agendamentoId: number,
    @param.path.number('servicoId') servicoId: number,
  ): Promise<Inclui> {
    const existente = await this.incluiRepository.findOne({where: {agendamentoId, servicoId}});
    if (existente) {
      throw new HttpErrors.Conflict('Este serviço já está incluído no agendamento.');
    }

    const novo = new Inclui({
      agendamentoId,
      servicoId,
      pendente: true,
      recomendado: false,
      executado: false,
    });

    return this.incluiRepository.create(novo);
  }

  @patch('/agendamentos/{agendamentoId}/servicos/{servicoId}', {
    responses: {
      '204': {
        description: 'Estado do serviço atualizado com sucesso',
      },
    },
  })
  async atualizarEstadoDoServico(
    @param.path.number('agendamentoId') agendamentoId: number,
    @param.path.number('servicoId') servicoId: number,
    @requestBody({
      content: {
        'application/json': {
          schema: {
            type: 'object',
            properties: {
              pendente: {type: 'boolean'},
              recomendado: {type: 'boolean'},
              executado: {type: 'boolean'},
            },
          },
        },
      },
    })
    estados: Partial<Inclui>,
  ): Promise<void> {
    const inclui = await this.incluiRepository.findOne({where: {agendamentoId, servicoId}});
    if (!inclui) {
      throw new HttpErrors.NotFound('Serviço não encontrado para este agendamento.');
    }

  await this.incluiRepository.updateAll(estados, {
    agendamentoId,
    servicoId
  });
}
}