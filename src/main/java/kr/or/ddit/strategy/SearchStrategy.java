package kr.or.ddit.strategy;

interface SearchStrategy {
    public void search();
}

class SearchStrategyAll implements SearchStrategy {
    public void search() {
        System.out.println("Search All");

    }
}

class SearchStrategyA implements SearchStrategy {
    public void search() {
        System.out.println("Search A");

    }
}

class SearchStrategyB implements SearchStrategy {
    public void search() {
        System.out.println("Search B");

    }
}

class SearchStrategyC implements SearchStrategy {
    public void search() {
        System.out.println("Search C");

    }
}
