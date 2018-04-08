namespace NStateManager.Tests
{
    public enum GameManEvent { Walk, Run, SeePuddle }
    public enum GameManState { Walking, Running, Jumping }

    public class GameMan
    {
        public GameManState State { get; set; }
    }

    public class AutoFallbackTest
    {
        public AutoFallbackTest()
        {
            var _stateMachine = new StateMachine<GameMan, GameManState, GameManEvent>(
                stateAccessor: man => man.State
              , stateMutator: (man, updatedState) => man.State = updatedState);

            _stateMachine.ConfigureState(GameManState.Walking)
               .AddAutoFallbackTransition(_=> true)
               .AddTransition(GameManEvent.SeePuddle, GameManState.Jumping);
        }
    }
}
