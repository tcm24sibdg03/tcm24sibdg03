import {Entity, model, property, belongsTo} from '@loopback/repository';
import {Agendamento} from './agendamento.model';
import {Servico} from './servico.model';

@model()
export class Inclui extends Entity {

  // Este campo 'id' é técnico e apenas necessário para o LoopBack executar o migrate()
  // A lógica real da aplicação continua a basear-se na chave composta (agendamentoId, servicoId)

  @property({
  type: 'number',
  id: true,
  generated: true,
  })
  id?: number;

  @property({
    type: 'boolean',
    default: false,
  })
  recomendado?: boolean;

  @property({
    type: 'boolean',
    default: false,
  })
  executado?: boolean;

  @property({
    type: 'boolean',
    default: true,
  })
  pendente?: boolean;

  @belongsTo(() => Agendamento, {name: 'agendamento'}, {required: true})
  agendamentoId: number;

  @belongsTo(() => Servico, {name: 'servico'}, {required: true})
  servicoId: number;


  constructor(data?: Partial<Inclui>) {
    super(data);
  }
}

export interface IncluiRelations {
  // describe navigational properties here
}

export type IncluiWithRelations = Inclui & IncluiRelations;
