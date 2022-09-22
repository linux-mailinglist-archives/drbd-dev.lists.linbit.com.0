Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 876815E57FC
	for <lists+drbd-dev@lfdr.de>; Thu, 22 Sep 2022 03:27:30 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 077944210D8;
	Thu, 22 Sep 2022 03:27:30 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 19C33421023
	for <drbd-dev@lists.linbit.com>;
	Thu, 22 Sep 2022 03:27:26 +0200 (CEST)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MXyHl0ZMKzpSv0;
	Thu, 22 Sep 2022 09:24:35 +0800 (CST)
Received: from [10.67.110.176] (10.67.110.176) by
	kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.2375.31; Thu, 22 Sep 2022 09:27:24 +0800
To: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
References: <20220920015216.782190-1-cuigaosheng1@huawei.com>
	<677922df-1674-a872-4bc6-e9c874ee4e46@linbit.com>
From: cuigaosheng <cuigaosheng1@huawei.com>
Message-ID: <4e781cdf-75c9-2cbb-acaf-9d3b5b6b5b58@huawei.com>
Date: Thu, 22 Sep 2022 09:27:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <677922df-1674-a872-4bc6-e9c874ee4e46@linbit.com>
X-Originating-IP: [10.67.110.176]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
	kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
Cc: linux-block@vger.kernel.org, axboe@kernel.dk, lars.ellenberg@linbit.com,
	philipp.reisner@linbit.com, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 0/2] Remove orphan declarations for drbd
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4098311110674786434=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

--===============4098311110674786434==
Content-Type: multipart/alternative;
	boundary="------------0A065A488ADB7A421004CE59"

--------------0A065A488ADB7A421004CE59
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

> PS: I think trivial fixes like this are important, but they also create
> additional maintenance burden. So if you have more of these in the
> future, maybe save them up and submit them all at once (maybe even in a
> single patch if they are related). Thanks!

Thanks for taking time to review these patches,I will try to submit such
patches all at once in the feature.Thanks for the reminder！

> Am 20.09.22 um 03:52 schrieb Gaosheng Cui:
>> This series contains a few cleanup patches, to remove a orphan
>> declaration which has been removed and some useless comments. Thanks!
>>
>> Gaosheng Cui (2):
>>    drbd: remove orphan _req_may_be_done() declaration
>>    block/drbd: remove useless comments in receive_DataReply()
>>
>>   drivers/block/drbd/drbd_receiver.c | 3 ---
>>   drivers/block/drbd/drbd_req.h      | 2 --
>>   2 files changed, 5 deletions(-)
>>
> Both patches look good to me, thanks.
>
> Acked-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
>
> PS: I think trivial fixes like this are important, but they also create
> additional maintenance burden. So if you have more of these in the
> future, maybe save them up and submit them all at once (maybe even in a
> single patch if they are related). Thanks!
>

--------------0A065A488ADB7A421004CE59
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">PS: I think trivial fixes like this are important, but they also create
additional maintenance burden. So if you have more of these in the
future, maybe save them up and submit them all at once (maybe even in a
single patch if they are related). Thanks!</pre>
      </blockquote>
    </p>
    <pre class="moz-quote-pre" wrap="">Thanks for taking time to review these patches,I will try to submit such
patches all at once in the feature.<span style="color: rgb(67, 67, 67); font-family: Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(252, 252, 254); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Thanks for the reminder！</span>
</pre>
    <blockquote type="cite"
      cite="mid:677922df-1674-a872-4bc6-e9c874ee4e46@linbit.com">
      <pre class="moz-quote-pre" wrap="">Am 20.09.22 um 03:52 schrieb Gaosheng Cui:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">This series contains a few cleanup patches, to remove a orphan
declaration which has been removed and some useless comments. Thanks!

Gaosheng Cui (2):
  drbd: remove orphan _req_may_be_done() declaration
  block/drbd: remove useless comments in receive_DataReply()

 drivers/block/drbd/drbd_receiver.c | 3 ---
 drivers/block/drbd/drbd_req.h      | 2 --
 2 files changed, 5 deletions(-)

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Both patches look good to me, thanks.

Acked-by: Christoph Böhmwalder <a class="moz-txt-link-rfc2396E" href="mailto:christoph.boehmwalder@linbit.com">&lt;christoph.boehmwalder@linbit.com&gt;</a>

PS: I think trivial fixes like this are important, but they also create
additional maintenance burden. So if you have more of these in the
future, maybe save them up and submit them all at once (maybe even in a
single patch if they are related). Thanks!

</pre>
    </blockquote>
  </body>
</html>

--------------0A065A488ADB7A421004CE59--

--===============4098311110674786434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============4098311110674786434==--
