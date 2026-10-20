using System.Runtime.CompilerServices;

namespace YamlDotNet.Serialization;

internal interface _003Ce90b0d63_002D97fe_002D48e5_002D8aba_002D6bd8b2703b95_003EIRegistrationLocationSelectionSyntax<[_003Cc9216621_002D2aa3_002D4985_002Db7b7_002D77b5f3db303b_003ENullable(2)] TBaseRegistrationType>
{
	void InsteadOf<TRegistrationType>() where TRegistrationType : TBaseRegistrationType;

	void Before<TRegistrationType>() where TRegistrationType : TBaseRegistrationType;

	void After<TRegistrationType>() where TRegistrationType : TBaseRegistrationType;

	void OnTop();

	void OnBottom();
}
