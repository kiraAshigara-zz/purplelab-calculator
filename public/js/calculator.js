var PurpleLabCalculator = (function () {

    String.prototype.format = function () {
        var formatted = this, i, size = arguments.length;
        for (i = 0; i < size; i++) {
            var regexp = new RegExp('\\{' + i + '\\}', 'gi');
            formatted = formatted.replace(regexp, arguments[i]);
        }
        return formatted;
    };

    function initialize() {
        registerEvents();
        loadCalculator();
    }

    function registerEvents() {
        $('.item-form select').on('change', function (ev) {
            var empty_option = $(this).find('option:selected').attr('empty-option');

            if (empty_option === '') {
                clearResults();
            } else {
                calculatePrice();
            }
        });

        $('.business-type-list').on('change', function () {
            var data = $(this).find('option:selected').data('business');

            if (data) {
                loadBusinessSize(data.size);
            }
        });
    }

    function loadCalculator() {
        $.ajax({
            url: '/purplelab/info',
            dataType: 'json'
        }).done(function (info) {
            $('.business-type-list').append('<option empty-option></option>');
            var option;

            $.each(info.business, function (i, business) {
                option = $('<option value="{0}">{1}</option>'.format(business.id, business.type));
                option.data('business', business);

                $('.business-type-list').append(option);

                if (i === 0) {
                    loadBusinessSize(business.size);
                }
            });

            $('.geo-list').append('<option empty-option></option>');

            $.each(info.geo, function (i, item) {
                option = $('<option>{0}</option>'.format(item.geo));
                option.data('geo', item);

                $('.geo-list').append(option);
            });

            $('.therapeutic_area-list').append('<option empty-option></option>');

            $.each(info.therapeutic_area, function (i, item) {
                option = $('<option>{0}</option>'.format(item.tp_class));
                option.data('therapeutic_area', item);

                $('.therapeutic_area-list').append(option);
            });

            $('.reports-list').append('<option empty-option></option>');

            $.each(info.reports, function (i, item) {
                option = $('<option>{0}</option>'.format(item.report));
                option.data('report', item);

                $('.reports-list').append(option);
            });

            $('.reports_retrievers-list').append('<option empty-option></option>');

            $.each(info.reports_retrievers, function (i, item) {
                option = $('<option>{0}</option>'.format(item.retreiver));
                option.data('reports_retrievers', item);

                $('.reports_retrievers-list').append(option);
            });

            $('.term-list').append('<option empty-option></option>');

            $.each(info.term, function (i, item) {
                option = $('<option>{0}</option>'.format(item.term));
                option.data('term', item);

                $('.term-list').append(option);
            });

            $('.num_of_users_list').append('<option empty-option></option>');

            $.each(info.num_of_users, function (i, item) {
                option = $('<option>{0}</option>'.format(item.users));
                option.data('num_of_users', item);

                $('.num_of_users_list').append(option);
            });

        }).fail(function (error) {
            console.error(error);
        });
    }

    function loadBusinessSize(size) {
        $('.business-size-list').empty();
        $('.business-size-list').append('<option empty-option></option>');

        var option;

        $.each(size, function (i, item) {
            option = $('<option>{0}</option>'.format(item.name));
            option.data('business', item);

            $('.business-size-list').append(option);
        });
    }

    function clearResults() {
        $('.base-annual,.full-term-pricing').val('');
        $('.price').text('');
    }

    function calculatePrice() {
        if ($('option[empty-option]:selected').length === 0) {
            var business_type = $('.business-type-list option:selected').data('business').id;
            var business_size = $('.business-size-list option:selected').data('business').id;
            var geo_discount = $('.geo-list option:selected').data('geo').geo_discount;
            var therapeutic_area = $('.therapeutic_area-list option:selected').data('therapeutic_area').tpc_multiplier;
            var reports = $('.reports-list option:selected').data('report').report_discount;
            var reports_retrievers = $('.reports_retrievers-list option:selected').data('reports_retrievers').retriever_discount;
            var term = $('.term-list option:selected').data('term').term.substring(0, 1).trim();
            var term_discount = $('.term-list option:selected').data('term').term_discount;
            var num_of_users = $('.num_of_users_list option:selected').data('num_of_users').user_multiplier;

            if (business_type === '8'){
            	num_of_users = $('.num_of_users_list option:selected').data('num_of_users').academic_multiplier;
            }

            $.ajax({
                url: '/purplelab/calculate?business_type={0}&business_size={1}&geo_discount={2}&therapeutic_area={3}&reports={4}&reports_retrievers={5}&term={6}&term_discount={7}&num_of_users={8}'.format(
                    business_type,
                    business_size,
                    geo_discount,
                    therapeutic_area,
                    reports,
                    reports_retrievers,
                    term,
                    term_discount,
                    num_of_users
                ),
                dataType: 'json'
            }).done(function (result) {
                $('.base-annual').val('$' + result.base_annual_subscription.toLocaleString());
                $('.price').text('$' + result.discounted_annual_subscription.toLocaleString());
                $('.full-term-pricing').val('$' + result.full_term_pricing.toLocaleString());
            }).fail(function (error) {
                console.error(error);
            });
        }
    }

    return {
        initialize: initialize
    };

})();

$(document).ready(function () {
    PurpleLabCalculator.initialize();
});
