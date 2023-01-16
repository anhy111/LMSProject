package kr.or.ddit.strategy;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
public class SearchButton {

    private final MyProgram myProgram;

    private SearchStrategy searchStrategy = new SearchStrategyAll();

    public void setSearchStrategy (SearchStrategy searchStrategy) {
        this.searchStrategy = searchStrategy;
    }

    public void onClick() {
        searchStrategy.search();
    }
}
