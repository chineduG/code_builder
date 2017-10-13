// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of code_builder.src.specs.expression;

/// Represents invoking [target] as a method with arguments.
class InvokeExpression extends Expression {
  /// Target of the method invocation.
  final Expression target;

  /// Optional; type of invocation.
  final InvokeExpressionType type;

  final List<Expression> positionalArguments;

  final Map<String, Expression> namedArguments;

  const InvokeExpression._(
    this.target,
    this.positionalArguments, [
    this.namedArguments = const {},
  ])
      : type = null;

  const InvokeExpression._new(
    this.target,
    this.positionalArguments, [
    this.namedArguments = const {},
  ])
      : type = InvokeExpressionType.newInstance;

  const InvokeExpression._const(
    this.target,
    this.positionalArguments, [
    this.namedArguments = const {},
  ])
      : type = InvokeExpressionType.constInstance;

  @override
  R accept<R>(ExpressionVisitor<R> visitor, [R context]) {
    return visitor.visitInvokeExpression(this, context);
  }

  @override
  String toString() =>
      '${type ?? ''} $target($positionalArguments, $namedArguments)';
}

enum InvokeExpressionType {
  newInstance,
  constInstance,
}