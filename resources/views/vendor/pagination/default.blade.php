@if ($paginator->hasPages())
    <ul class="pagination">
        {{-- Primera Página y Página Anterior --}}
        @if ($paginator->onFirstPage())
            <li class="disabled"><span>&laquo;&laquo;</span></li>
            <li class="disabled"><span>&laquo;</span></li>
        @else
            <li><a href="{{ $paginator->url(1) }}" rel="first">&laquo;&laquo;</a></li>
            <li><a href="{{ $paginator->previousPageUrl() }}" rel="prev">&laquo;</a></li>
        @endif

        {{-- Elementos de paginación --}}
        @foreach ($elements as $element)
            @if (is_string($element))
                <li class="disabled"><span>{{ $element }}</span></li>
            @endif

            @if (is_array($element))
                @php
                    $start = max($paginator->currentPage() - 2, 1);
                    $end = min($paginator->currentPage() + 2, $paginator->lastPage());
                @endphp

                @if ($start > 1)
                    <li class="disabled"><span>...</span></li>
                @endif

                @foreach (range($start, $end) as $page)
                    @if ($page == $paginator->currentPage())
                        <li class="active"><span>{{ $page }}</span></li>
                    @else
                        <li><a href="{{ $paginator->url($page) }}">{{ $page }}</a></li>
                    @endif
                @endforeach

                @if ($end < $paginator->lastPage())
                    <li class="disabled"><span>...</span></li>
                @endif
            @endif
        @endforeach

        {{-- Siguiente Página y Última Página --}}
        @if ($paginator->hasMorePages())
            <li><a href="{{ $paginator->nextPageUrl() }}" rel="next">&raquo;</a></li>
            <li><a href="{{ $paginator->url($paginator->lastPage()) }}" rel="last">&raquo;&raquo;</a></li>
        @else
            <li class="disabled"><span>&raquo;</span></li>
            <li class="disabled"><span>&raquo;&raquo;</span></li>
        @endif
    </ul>
@endif
