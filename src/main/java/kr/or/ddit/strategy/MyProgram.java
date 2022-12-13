package kr.or.ddit.strategy;

public class MyProgram {

    private final SearchButton searchButton = new SearchButton(this);

    public void setModeAll () {
        searchButton.setSearchStrategy(new SearchStrategyAll());
    }

    public void setModeA () {
        searchButton.setSearchStrategy(new SearchStrategyA());
    }

    public void setModeB () {
        searchButton.setSearchStrategy(new SearchStrategyB());
    }

    public void setModeC () {
        searchButton.setSearchStrategy(new SearchStrategyC());
    }

    public void testProgram() {
        searchButton.onClick();
        setModeA();
        searchButton.onClick();
        setModeB();
        searchButton.onClick();
        setModeC();
        searchButton.onClick();
    }
}
