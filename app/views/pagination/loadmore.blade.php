<?php
$presenter = new Illuminate\Pagination\BootstrapPresenter($paginator);
?>

<?php if ($paginator->getLastPage() > 1): ?>
    <div class="loadmore">
        <a href="javascript:void(0)" class="loadmore-data more submit-field" data-page="<?php echo
        $paginator->getCurrentPage(); ?>" rel="nofollow">
            <?php echo $paginator->getCurrentPage() >= $paginator->getLastPage() ? '没有了' : '点击加载更多'; ?>
        </a>
    </div>
    @section('scripts')
    <script type="text/javascript">
        (function($) {
            $(document).ready(function() {
                var lastPage = <?php echo $paginator->getLastPage(); ?>;
                var data_wrapper = $('[data-role="data-wrapper"]');

                $('.loadmore').delegate('.loadmore-data', 'click', function() {
                    var $el = $(this);
                    var nextPage = $el.data('page') + 1;
                    $.ajax({
                        data: {page: nextPage},
                        dataType: 'json',
                        beforeSend: function() {
                            if (nextPage > lastPage) {
                                return false;
                            }
                            $el.text('加载中...')
                        },
                        success: function(result) {
                            if (result.data) {

                                $(result.data).appendTo($(data_wrapper));

                                if (nextPage < lastPage) {
                                    $el.text('点击加载更多')
                                } else {
                                    $el.text('没有了');
                                    $el.removeClass('more')
                                }

                                $el.data('page', nextPage)
                            }
                        }
                    })
                })
            })
        })(jQuery)
    </script>
    @stop
<?php endif; ?>
