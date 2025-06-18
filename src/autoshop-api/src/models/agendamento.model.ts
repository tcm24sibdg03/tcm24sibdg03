import {Entity, model, property, hasMany,} from '@loopback/repository';
import {Servico} from './servico.model';
import {Inclui} from './inclui.model';

export enum StatusAgendamento {
  PENDENTE = 'Pendente',
  CONFIRMADO = 'Confirmado',
  CANCELADO = 'Cancelado',
}

@model()
export class Agendamento extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'string',
    required: true,
  })
  data: string;

  @property({
    type: 'string',
    required: true,
  })
  hora: string;

  @property({
  type: 'string',
  required: true,
  jsonSchema: {
    enum: Object.values(StatusAgendamento),
    },
  })
  status: StatusAgendamento;

  @property({
    type: 'number',
    required: true,
  })
  veiculoId: number;

  @hasMany(() => Servico, {
    through: {
      model: () => Inclui,
      keyFrom: 'agendamentoId',
      keyTo: 'servicoId',
    },
  })
  servicos: Servico[];

  constructor(data?: Partial<Agendamento>) {
    super(data);
  }
}

export interface AgendamentoRelations {
  // describe navigational properties here
}

export type AgendamentoWithRelations = Agendamento & AgendamentoRelations;
