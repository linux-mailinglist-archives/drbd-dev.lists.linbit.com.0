Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B9427B905
	for <lists+drbd-dev@lfdr.de>; Tue, 29 Sep 2020 02:46:33 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 55680420AFF;
	Tue, 29 Sep 2020 02:46:32 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtprelay.hostedemail.com (smtprelay0097.hostedemail.com
	[216.40.44.97])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2DD74420AE0
	for <drbd-dev@lists.linbit.com>; Tue, 29 Sep 2020 02:46:30 +0200 (CEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
	[10.5.19.251])
	by smtpgrave02.hostedemail.com (Postfix) with ESMTP id 1D2F218005A6F
	for <drbd-dev@lists.linbit.com>; Tue, 29 Sep 2020 00:46:00 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
	[216.40.38.60])
	by smtprelay01.hostedemail.com (Postfix) with ESMTP id 780A9100E7B40;
	Tue, 29 Sep 2020 00:45:28 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
	RULES_HIT:41:355:379:599:967:973:988:989:1260:1263:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2525:2553:2561:2564:2682:2685:2693:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3870:3872:3873:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:4362:4605:5007:6248:6742:7903:9025:9040:10004:10400:10848:10967:11232:11658:11914:12043:12266:12295:12297:12438:12740:12760:12895:13069:13071:13161:13229:13311:13357:13439:14180:14181:14659:14721:14777:21060:21080:21365:21433:21451:21627:30054:30090:30091,
	0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
	DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none,
	Custom_rules:0:0:0, LFtime:1, LUA_SUMMARY:none
X-HE-Tag: self77_011759527186
X-Filterd-Recvd-Size: 2723
Received: from XPS-9350.home (unknown [47.151.133.149])
	(Authenticated sender: joe@perches.com)
	by omf03.hostedemail.com (Postfix) with ESMTPA;
	Tue, 29 Sep 2020 00:45:25 +0000 (UTC)
Message-ID: <b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Mark Brown <broonie@kernel.org>, linux-iio@vger.kernel.org, Julia Lawall
	<Julia.Lawall@inria.fr>
Date: Mon, 28 Sep 2020 17:45:24 -0700
In-Reply-To: <160132172369.55460.9237357219623604216.b4-ty@kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
	<160132172369.55460.9237357219623604216.b4-ty@kernel.org>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Cc: linux-ide@vger.kernel.org, linux-clk@vger.kernel.org,
	=?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
	David Lechner <david@lechnology.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-wireless@vger.kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	Valdis@linbit.com, linux-block@vger.kernel.org,
	linux-acpi@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
	openipmi-developer@lists.sourceforge.net, drbd-dev@lists.linbit.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Drbd-dev] [PATCH 00/18] use semicolons rather than commas to
 separate statements
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Mon, 2020-09-28 at 20:35 +0100, Mark Brown wrote:
> On Sun, 27 Sep 2020 21:12:10 +0200, Julia Lawall wrote:
> > These patches replace commas by semicolons.  This was done using the
> > Coccinelle semantic patch (http://coccinelle.lip6.fr/) shown below.
> > 
> > This semantic patch ensures that commas inside for loop headers will not be
> > transformed.  It also doesn't touch macro definitions.
> > 
> > Coccinelle ensures that braces are added as needed when a single-statement
> > branch turns into a multi-statement one.
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next
> 
> Thanks!
> 
> [1/1] regmap: debugfs: use semicolons rather than commas to separate statements
>       commit: 7f4a122d0b50b40c64d24a5cf7aafe26dd9487ee

Hi Mark.

Rather than replying to the 0/n cover letter to a patch
series, can you reply to each of the specific patches in
the patch series you are applying?

Otherwise, it's a bit difficult to figure out which patches
you are applying.

thanks

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
