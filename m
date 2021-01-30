Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CD03097D4
	for <lists+drbd-dev@lfdr.de>; Sat, 30 Jan 2021 20:10:56 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9FF06420168;
	Sat, 30 Jan 2021 20:10:55 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtprelay.hostedemail.com (smtprelay0065.hostedemail.com
	[216.40.44.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 40015420069
	for <drbd-dev@lists.linbit.com>; Sat, 30 Jan 2021 20:10:53 +0100 (CET)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
	[10.5.19.251])
	by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 673828009649
	for <drbd-dev@lists.linbit.com>; Sat, 30 Jan 2021 18:57:53 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
	[216.40.38.60])
	by smtprelay01.hostedemail.com (Postfix) with ESMTP id 2EBA1100E7B46;
	Sat, 30 Jan 2021 18:57:51 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
	RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1261:1277:1311:1313:1314:1345:1359:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3868:4321:5007:6119:7652:10004:10400:10848:11026:11232:11658:11914:12043:12297:12555:12740:12895:12986:13069:13311:13357:13439:13894:14181:14659:14721:21080:21627:21990:30054:30091,
	0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
	DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none,
	Custom_rules:0:0:0, LFtime:1, LUA_SUMMARY:none
X-HE-Tag: dad66_00075af275b3
X-Filterd-Recvd-Size: 1822
Received: from [192.168.1.159] (unknown [47.151.137.21])
	(Authenticated sender: joe@perches.com)
	by omf02.hostedemail.com (Postfix) with ESMTPA;
	Sat, 30 Jan 2021 18:57:49 +0000 (UTC)
Message-ID: <5deee552f4bcfd81c6dc6ec3e8139c0c4ba27d31.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Jiri Kosina <trivial@kernel.org>, Philipp Reisner
	<philipp.reisner@linbit.com>, Lars Ellenberg <lars.ellenberg@linbit.com>
Date: Sat, 30 Jan 2021 10:57:48 -0800
In-Reply-To: <1c8081264d82101d7837220c5ee221c307da5d91.1598331148.git.joe@perches.com>
References: <cover.1598331148.git.joe@perches.com>
	<1c8081264d82101d7837220c5ee221c307da5d91.1598331148.git.joe@perches.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 06/29] drbd: Avoid comma separated statements
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Mon, 2020-08-24 at 21:56 -0700, Joe Perches wrote:
> Use semicolons and braces.

ping?

> Signed-off-by: Joe Perches <joe@perches.com>
> ---
> =A0drivers/block/drbd/drbd_receiver.c | 6 ++++--
> =A01 file changed, 4 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd=
_receiver.c
> index 422363daa618..87f732fb5456 100644
> --- a/drivers/block/drbd/drbd_receiver.c
> +++ b/drivers/block/drbd/drbd_receiver.c
> @@ -111,8 +111,10 @@ static struct page *page_chain_tail(struct page *pag=
e, int *len)
> =A0{
> =A0	struct page *tmp;
> =A0	int i =3D 1;
> -	while ((tmp =3D page_chain_next(page)))
> -		++i, page =3D tmp;
> +	while ((tmp =3D page_chain_next(page))) {
> +		++i;
> +		page =3D tmp;
> +	}
> =A0	if (len)
> =A0		*len =3D i;
> =A0	return page;


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
