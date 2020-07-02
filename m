Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BD64A21293C
	for <lists+drbd-dev@lfdr.de>; Thu,  2 Jul 2020 18:23:14 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9CFD24203F1;
	Thu,  2 Jul 2020 18:23:13 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtprelay.hostedemail.com (smtprelay0223.hostedemail.com
	[216.40.44.223])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C74D14203BB
	for <drbd-dev@lists.linbit.com>; Thu,  2 Jul 2020 18:23:12 +0200 (CEST)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
	[216.40.38.60])
	by smtprelay04.hostedemail.com (Postfix) with ESMTP id 53EF6180A813A;
	Thu,  2 Jul 2020 16:23:11 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
	RULES_HIT:41:355:379:599:960:967:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2525:2553:2560:2563:2682:2685:2828:2859:2902:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3873:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4250:4321:5007:6119:6248:6742:7875:9010:9025:9040:10004:10400:11026:11232:11658:11914:12043:12295:12297:12438:12679:12740:12760:12895:13069:13073:13095:13181:13229:13311:13357:13439:13618:14096:14097:14180:14181:14659:14721:14777:21060:21080:21324:21433:21451:21611:21627:21939:30054:30060:30070:30079:30080:30090:30091,
	0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
	DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none,
	Custom_rules:0:0:0, LFtime:1, LUA_SUMMARY:none
X-HE-Tag: eggs64_191235726e8a
X-Filterd-Recvd-Size: 3163
Received: from XPS-9350.home (unknown [47.151.133.149])
	(Authenticated sender: joe@perches.com)
	by omf06.hostedemail.com (Postfix) with ESMTPA;
	Thu,  2 Jul 2020 16:23:08 +0000 (UTC)
Message-ID: <f65392bbd1732eff72d5b24c5ba3ea230ab2a3ae.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Kees Cook <keescook@chromium.org>, Mark Brown <broonie@kernel.org>
Date: Thu, 02 Jul 2020 09:23:07 -0700
In-Reply-To: <202007020839.545A571CA4@keescook>
References: <20200620033007.1444705-1-keescook@chromium.org>
	<20200620033007.1444705-9-keescook@chromium.org>
	<20200701203920.GC3776@sirena.org.uk> <202007020819.318824DA@keescook>
	<20200702152335.GJ4483@sirena.org.uk>
	<202007020839.545A571CA4@keescook>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Cc: linux-ide@vger.kernel.org, linux-wireless@vger.kernel.org,
	clang-built-linux@googlegroups.com, linux-doc@vger.kernel.org,
	netdev@vger.kernel.org, x86@kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-block@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	linux-mm@kvack.org, Alexander Potapenko <glider@google.com>,
	b43-dev@lists.infradead.org, Andy Whitcroft <apw@canonical.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH v2 08/16] spi: davinci: Remove
	uninitialized_var() usage
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

On Thu, 2020-07-02 at 08:42 -0700, Kees Cook wrote:
> On Thu, Jul 02, 2020 at 04:23:35PM +0100, Mark Brown wrote:
> > On Thu, Jul 02, 2020 at 08:21:40AM -0700, Kees Cook wrote:
> > > On Wed, Jul 01, 2020 at 09:39:20PM +0100, Mark Brown wrote:
> > > > Please copy maintainers on patches :(
> > > Hi! Sorry about that; the CC list was giant, so I had opted for using
> > > subsystem mailing lists where possible.
> > 
> > If you're going to err in a direction there I'd err in the direction of
> > CCing the people not the list - I only saw this since I was looking for
> > something else, I don't normally see stuff in the mailing list folder.
> 
> Yeah, I've gotten conflicting feedback on treewide changes:
> - please CC me on only the one patch, I don't want to see everything else
> - please CC me on the whole series, I want the full context for the change
> 
> I opted toward "CC me on this series", but then I get stuck when the CC
> is giant. I think I may switch back to individual CCs for specific
> patches, and point people to lore if they want greater context. (lore
> didn't exist before...)

IMO:

For a patch series that spans multiple subsystems,
each patch should always CC any specific subsystem
maintainers..

A good trick would be to use the cover letter
message-id: and have each individual patch in the
series reference the cover letter id below the
--- line so any reviewer doesn't have to find the
in-reply-to: message id and then reference the
lore link.

Something like:

---

For complete series see: https://lore.kernel.org/r/<cover_letter_message_id>


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
